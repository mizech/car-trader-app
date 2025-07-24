require "debug"

class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(set_params)

    if @vendor.save
      redirect_to root_path
      flash[:notice] = "Vendor successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to root_path
  end

  def set_params
    params.expect(vendor: [ :name, :country ])
  end
end
