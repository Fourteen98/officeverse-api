module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_user
      before_action :set_reservation, only: %i[show update destroy]

      def index
        @user = User.find(params[:user_id])
        @reservations = @user.reservations
        render json: @reservations, include: %i[office services peripherals]
      end

      def show
        render json: @reservation, include: %i[office services peripherals]
      end

      def create
        @reservation = Reservation.new(start_date: params[:start_date],
                                       end_date: params[:end_date], office_id: params[:office_id],
                                       user_id: params[:user_id], service_ids: params[:service_ids], peripheral_ids: params[:peripheral_ids])
        # binding.b
        # @reservation.service_ids << reservation_params[:service_ids]

        if @reservation.save
          render json: @reservation, include: %i[office services peripherals], status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @reservation.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :user_id, :office_id, service_ids: [], peripheral_ids: [])
      end
    end
  end
end
