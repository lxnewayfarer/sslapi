# sidekiq initializer
require 'sidekiq'
require 'sidekiq/web'

#   Basic auth
Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == %w[admin admin]
  # для большей надежности можно использовать
  # ActiveSupport::SecurityUtils.secure_compare
end
