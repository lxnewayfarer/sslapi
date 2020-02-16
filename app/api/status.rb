class Status < Grape::API
    format :json
    get :status do
        domains = Domain.order('created_at DESC');
    end     
  end


  