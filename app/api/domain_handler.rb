class DomainHandler < Grape::API
    format :json
    get :domain do
        domains = Domain.order('created_at DESC');
        present domains
    end    

   

  end
