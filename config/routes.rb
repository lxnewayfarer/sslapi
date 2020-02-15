Rails.application.routes.draw do
  namespace 'api' do
    resources :status
    resources :domain
  end
end
