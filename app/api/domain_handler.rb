class DomainHandler < Grape::API
  format :json

  # method `GET /domain` presents only data expired by grape entities
  get :domain do
    present Domain.order("created_at DESC"), with: Entities::DomainEntity
  end

  # method `POST /domain` adding domain. example: { "domain": "https://domain.com" }
  desc "Add domain"
  params do
    requires :domain, type: String, desc: 'Domain you want to add, for example: "https://google.com"'
  end
  post :domain do
    new_domain = Domain.new(params)
    if new_domain.save
      CheckWorker.perform_async(new_domain.domain)
      present response: "Domain added", id: new_domain.id, domain: new_domain.domain
    else
      present response: "Error adding domain", data: new_domain.errors
    end
  end

  # method `DELETE /domain` deleting domain by id
  desc "Delete domain"
  params do
    requires :id, type: Integer, desc: "Domain ID"
  end
  delete :domain do
    domain = Domain.find(params[:id])
    domain.destroy
    present response: "Domain deleted", data: domain[:domain]
  rescue ActiveRecord::RecordNotFound
    present response: "Error deleting domain. Record not found"
  end

  # method `PUT /domain` updating domain by id
  desc "Update domain"
  params do
    requires :id, type: Integer, desc: "Domain ID"
    requires :domain, type: String, desc: 'Domain you want to make a new, for example: "https://google.com"'
  end
  put :domain do
    domain = Domain.find(params[:id])
    domain.update_attributes(params)
    present response: "Domain updated", data: domain[:domain]
  rescue ActiveRecord::RecordNotFound
    present response: "Error updating domain. Record not found"
  end
end
