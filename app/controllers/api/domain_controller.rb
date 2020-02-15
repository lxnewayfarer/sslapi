module Api
    class DomainController < ApplicationController
        def create
            domain = Domain.new(domain_name);
            if domain.save
                render json: {status: 'SUCCESS', data: domain}, status: :ok   
            else
                render json: {status: 'ERROR', data: domain.errors}, status: :ok   
            end
        end

        private
        def domain_name
            params.permit(:domain)
        end
    end
end