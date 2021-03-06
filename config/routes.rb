Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  # config/routes.rb
  mount Sidekiq::Web, at: '/sidekiq'
  mount DomainHandler => '/'
  mount Status => '/'
end
