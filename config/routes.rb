Rails.application.routes.draw do
  mount DomainHandler => '/'
  mount Status => '/'
end
