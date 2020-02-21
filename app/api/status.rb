# метод GET /status просто показывает всю информацию
class Status < Grape::API
  format :json

  get :status do
    domains = Domain.order('created_at DESC')
    present domains
  end
end
