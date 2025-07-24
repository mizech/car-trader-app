class CarsController < ApplicationController
  before_action :set_car, only: [ :show, :destroy ]
  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    puts " -- Car#create --"
    @car = Car.create(set_params)
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def set_params
    params.expect(car: [ :name, :price, :vendor_id ])
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
