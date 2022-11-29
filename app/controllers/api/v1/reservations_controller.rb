module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_user

      def index
        @reservations = @user.reservations
        render json: @reservations
      end

      def show; end

      def create; end

      def destroy; end
    end
  end
end
