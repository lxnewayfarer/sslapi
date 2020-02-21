require 'sidekiq-scheduler'
require 'openssl'
require 'net/https'

# CheckWorker получает в качестве параметра домен и
# проверяет SSL для этого домена, а затем обновляет
# информацию в базе
class CheckWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(domain)
    d = Domain.find_by(domain: domain)
    current_state = ''
    expire_days = -1
    # trying to get certificate
    begin
      uri = URI.parse(d.domain)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.start do |h|
        @cert = h.peer_cert
      end
      # catching exception
    rescue StandardError => e
      e = e.to_s
      # identifying exception
      current_state = if e.index('SSL_connect')
                        e.sub(/.*: /, '')
                      else
                        'Non-SSL error'
                      end
      # if theres no exceptions we can take expire date
    else
      expire_date = @cert.not_after
      expire_days = ((expire_date - Time.now) / 3600 / 24).floor
    end
    d.update_attribute(:expire_days, expire_days)

    # updating status. true - no errors, false - theres errors
    if current_state == ''
      d.update_attribute(:status_is_fine, true)
    else
      d.update_attribute(:status_is_fine, false)
    end

    # updating current_state. empty string means no errors
    if current_state == ''
      current_state = if expire_days < 7
                        'cerificate expires less than in 1 week'
                      elsif expire_days < 14
                        'cerificate expires less than in 2 week'
                      else
                        'all fine'
                      end
    end
    d.update_attribute(:current_state, current_state)
  end
end
