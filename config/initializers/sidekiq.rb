# sidekiq initializer
require 'sidekiq'
require 'sidekiq/web'

#   Basic auth
Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  #[user, password] == ["admin", "admin"]
  # вроде как проверка "==" более уязвима 
  # login и password в .env файле в корне проекта 
  ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(user), 
  ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USER"])) & 
  ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), 
  ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
end