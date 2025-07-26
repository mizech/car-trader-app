class CarsController < ApplicationController
  before_action :set_car, only: [ :show, :destroy, :edit, :update ]
  before_action :authenticate_user!
  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.create(set_params)
    if @car.save
      flash[:notice] = "Car successfully created."
      redirect_to cars_path
    else
      flash[:notice] = "Car creation failed."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @car.update(set_params)
      redirect_to car_path(@car)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    flash[:notice] = "Car has become deleted."
    redirect_to cars_path
  end

  def set_params
    params.expect(car: [ :name, :price, :vendor_id ])
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
