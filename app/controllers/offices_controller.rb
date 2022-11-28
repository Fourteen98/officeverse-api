class OfficesController < ApplicationController
  def index
    @offices = Office.all
    render json: @offices
  end

  def show
    @Office = Office.find(params[:id])
    render json: @Office
  end

  def create 
    @office = Office.new(office_params)
    if @office.save
      render json: @office, status: :created, location: @office
    else
      render json: @office.errors, status: :unprocessable_entity
    end
  end

  def delete 
    Service.find(params[:id]).destroy
  end


  private 
  def office_params
    params.require(:office).permit(:title, :description, :area, :occupancy, :images, :basic_price, :address)
  end
end
