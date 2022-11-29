module Api
  module V1
    class OfficesController < ApplicationController
      def index
        @offices = Office.all
        render json: @offices
      end

      def show
        @office = Office.find(params[:id])
        render json: @office
      rescue StandardError
        render json: "Couldn't find office with 'id'=#{params[:id]}", status: 404
      end

      def create
        @office = Office.new(office_params)
        if @office.save
          render json: @office, status: :created
        else
          render json: @office.errors, status: 422
        end
      rescue StandardError
        render json: 'Invalid entry, or value is empty', status: 422
      end

      def destroy
        Office.find(params[:id]).destroy
      end

      private

      def office_params
        current_user = User.first
        params.require(:office).permit(:title, :description, :area, :occupancy, :images, :basic_price, :address).with_defaults(user_id: current_user.id)
      end
    end
  end
end
