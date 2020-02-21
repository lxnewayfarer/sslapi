require "sidekiq-scheduler"

# SslWorker запускает проверку для каждого домена в базе
# запускаеся каждые 20 минут. настройки в sidekiq.yml

class SslWorker
  include Sidekiq::Worker

  def perform()
    domains = Domain.all
    domains.each do |d|
      CheckWorker.perform_async(d.domain)
    end
  end
  
end
