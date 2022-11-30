module Api
  module V1
    class PeripheralsController < ApplicationController
      before_action :set_peripheral, only: %i[show update destroy]
      before_action :set_reservation

      # GET /peripherals
      def index
        @peripherals = @reservation.peripherals

        render json: @peripherals
      end

      # GET /peripherals/1
      def show
        render json: @peripheral
      end

      # POST /peripherals
      def create
        @peripheral = Peripheral.new(peripheral_params)

        if @peripheral.save
          render json: @peripheral, status: :created, location: @peripheral
        else
          render json: @peripheral.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /peripherals/1
      def update
        if @peripheral.update(peripheral_params)
          render json: @peripheral
        else
          render json: @peripheral.errors, status: :unprocessable_entity
        end
      end

      # DELETE /peripherals/1
      def destroy
        @peripheral.destroy
      end

      private

      def set_reservation
        @reservation = Reservation.find(params[:reservation_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_peripheral
        @peripheral = Peripheral.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def peripheral_params
        params.require(:peripheral).permit(:name, :description, :price)
      end
    end
  end
end
