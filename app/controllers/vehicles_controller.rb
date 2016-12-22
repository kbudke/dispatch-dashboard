class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  after_action :checkState, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  require 'json'

 

  #Loads All Vehicles
  def index
   @vehicles = Vehicle.all
  end


  def show
      #Drives Google Map & Updates Vehicle Distance
      @waypoints = Array.new
      if @vehicle.origin.nil? || @vehicle.destination.nil?
      else
      directions = GoogleDirections.new(@vehicle.origin, @vehicle.destination)
      @vehicle.update(distance: directions.distance_in_miles)
      end
      @waypoints.push @vehicle.destination
  end

  #Method to check current state of vehicle (needs to be moved to helper or model)
  def checkState
      if @vehicle.truck_id == "" || @vehicle.truck_id == nil
        @vehicle.currentState = "Available"
      elsif @vehicle.currentState = "Available"
        @vehicle.currentState = "Queued"
      end
      @vehicle.save
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @vehicle.currentState = "Available";
    @vehicle.save
  end

  # GET /vehicles/1/edit
  def edit 
  end

  
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @user = current_user
    @vehicle.set_user!(current_user)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:name, :make, :model, :details, :yearManufactured,:distance, :origin, :origin_latitude, :origin_longitude, :destination, :destination_latitude, :destination_longitude, :vinNumber, :minimumPossibleWeight, :maximumPossibleWeight, :actualWeight, :truck_id, :image, :remote_image_url, :customername, :currentState, :company_id, :user_id)
  end
end
