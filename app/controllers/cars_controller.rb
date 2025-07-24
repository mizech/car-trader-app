class CarsController < ApplicationController
  def index
    @cars = Car.all
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

  def set_params
    params.expect(car: [ :name, :price, :vendor_id ])
  end
end
