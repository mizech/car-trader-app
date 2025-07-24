class VendorsController < ApplicationController
  before_action :set_vendor, only: [ :show, :destroy, :edit, :update ]
  def index
    @vendors = Vendor.all
  end

  def show
  end

  def edit
  end

  def update
    if @vendor.update(set_params)
      redirect_to vendor_path(@vendor)
    else
      redirect_to :edit, status: :unprocessable_entity
    end
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
      flash[:notice] = "Vendor creation failed."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor.destroy
    flash[:notice] = "Vendor has become deleted."
    redirect_to root_path
  end

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end

  def set_params
    params.expect(vendor: [ :name, :country ])
  end
end
