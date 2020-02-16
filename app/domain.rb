class Domaine < Grape::API
    format :json
    get :domain do
      domains = Domain.order('created_at DESC');
      domains
    end

    post :domain do
      
    end

   
    
  end
