module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_user
      before_action :set_reservation, only: %i[show update destroy]

      def index
        @reservations = @user.reservations
        render json: @reservations
      end

      def show
        render json: @reservation
      end

      def create; end

      def destroy; end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_reservation
        @reservation = Reservation.find(params[:id])
      end
    end
  end
end
