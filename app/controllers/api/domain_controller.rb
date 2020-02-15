module Api
    class DomainController < ApplicationController
        def index
            domains = Domain.order('created_at DESC');
            render json: {status: 'SUCCESS', message: 'done', data: domains}, status: :ok   
        end
    end
end