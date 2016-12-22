class WelcomeController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:splash]


  def index
    #Load Invoices Drivers Trucks and Orders for user
    @invoices = Invoice.where(user_id: current_user)
    @drivers = Driver.where(user_id: current_user)
    @orders = Order.where(user_id: current_user)
    @delivery_trucks = DeliveryTruck.where(user_id: current_user)
    #Find Orders that are unpaid (needs to be refactored, don't need to hit DB
    @unpaidOrders = Order.where(user_id: current_user, currentState: "Unpaid")
  	#Load All Vehicles
  	@vehicles = Vehicle.order(:id)
    #Count Trucks in fleet
    @deliveryTruckCount = @delivery_trucks.length
    #Variable for pending trucks
    @pendingcount = 0

    #Check for carload truck / change truck (needs refactor)
    if params[:truck_id]== nil && params[:carId]== nil
    else
      if @vehicles.any?
      @vehicles.each do |vehicle|
        if vehicle.id.to_s == params[:carId]
          vehicle.update(truck_id: params[:truck_id])
          vehicle.update(currentState: "Queued")
        end
      end
    end
    end

    #Check for destination filter (needs refactor)
    if params[:destination]== nil && params[:origin]== nil
      @tableVehicles = @vehicles.where(currentState: "Available")
    elsif params[:origin] == nil 
      @tableVehicles = @vehicles.where("destination LIKE ?", params[:destination], currentState: "Available")
    end

    #Check for origin filter (needs refactor)
    if params[:origin]== nil && params[:destination]== nil
      @tableVehicles = @vehicles.where(currentState: "Available")
    elsif params[:destination] == nil
      @tableVehicles = @vehicles.where("origin LIKE ?", params[:origin])
    end
    if @tableVehicles.any?
    @tableVehicleCount = @tableVehicles.length
    end
  end

  #Loads trucks and vehicles for modal (trying to update with ajax)
  def _truckmodal
    @truck = Truck.where(params[:truck_id])
    @vehicles = Vehicle.all
  end

  #adds ALL delivery trucks and Vehicles to consolepage
  def consolepage
    @delivery_trucks = DeliveryTruck.all
    @vehicles = Vehicle.all
  end

  #adds vehicles for splash page demo table
  def splash
    @vehicles = Vehicle.all
  end

  #Orders for calendar on dashboard invoice tab
  def calendar
    @orders = Order.where(user_id: current_user)
  end

end
