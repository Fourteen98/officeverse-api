module Api
  module V1
    class ServicesController < ApplicationController
      def index
        @services = Service.all

        render json: @services
      end

      def show
        @service = Service.find(params[:id])

        render json: @service
      end

      def create
        @service = Service.new(service_params)

        if @service.save
          render json: @service, status: :created, location: @service
        else
          render json: @service.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Service.find(params[:id]).destroy
      end

      private

      # Only allow a list of trusted parameters through.
      def service_params
        params.require(:service).permit(:name, :description, :price)
      end
    end
  end
end
