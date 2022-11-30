module Api
  module V1
    class ServicesController < ApplicationController
      before_action :set_reservation
      def index
        @services = @reservation.services

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

      # Use callbacks to share common setup or constraints between actions.
      def set_reservation
        @reservation = Reservation.find(params[:reservation_id])
      end

      # Only allow a list of trusted parameters through.
      def service_params
        params.require(:service).permit(:name, :description, :price)
      end
    end
  end
end
