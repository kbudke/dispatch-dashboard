require 'test_helper'

class DeliveryTrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_truck = delivery_trucks(:one)
  end

  test 'should get index' do
    get delivery_trucks_url
    assert_response :success
  end

  test 'should get new' do
    get new_delivery_truck_url
    assert_response :success
  end

  test 'should create delivery_truck' do
    assert_difference('DeliveryTruck.count') do
      post delivery_trucks_url, params: { delivery_truck: { avgMPG: @delivery_truck.avgMPG, carFax: @delivery_truck.carFax, cityMPG: @delivery_truck.cityMPG, currentLocation: @delivery_truck.currentLocation, destination: @delivery_truck.destination, destinationLocation: @delivery_truck.destinationLocation, estimatedArrivalTime: @delivery_truck.estimatedArrivalTime, highwayMPG: @delivery_truck.highwayMPG, maintenanceHistory: @delivery_truck.maintenanceHistory, make: @delivery_truck.make, maximumPossibleWeight: @delivery_truck.maximumPossibleWeight, minimumPossibleWeight: @delivery_truck.minimumPossibleWeight, model: @delivery_truck.model, name: @delivery_truck.name, nextMaintenance: @delivery_truck.nextMaintenance, origin: @delivery_truck.origin, originLocation: @delivery_truck.originLocation, payloadEmptyWeight: @delivery_truck.payloadEmptyWeight, requestedArrivalTime: @delivery_truck.requestedArrivalTime, scheduledDepartureTime: @delivery_truck.scheduledDepartureTime, vinNumber: @delivery_truck.vinNumber, weightCapacity: @delivery_truck.weightCapacity, yearAquired: @delivery_truck.yearAquired, yearManufactured: @delivery_truck.yearManufactured } }
    end

    assert_redirected_to delivery_truck_url(DeliveryTruck.last)
  end

  test 'should show delivery_truck' do
    get delivery_truck_url(@delivery_truck)
    assert_response :success
  end

  test 'should get edit' do
    get edit_delivery_truck_url(@delivery_truck)
    assert_response :success
  end

  test 'should update delivery_truck' do
    patch delivery_truck_url(@delivery_truck), params: { delivery_truck: { avgMPG: @delivery_truck.avgMPG, carFax: @delivery_truck.carFax, cityMPG: @delivery_truck.cityMPG, currentLocation: @delivery_truck.currentLocation, destination: @delivery_truck.destination, destinationLocation: @delivery_truck.destinationLocation, estimatedArrivalTime: @delivery_truck.estimatedArrivalTime, highwayMPG: @delivery_truck.highwayMPG, maintenanceHistory: @delivery_truck.maintenanceHistory, make: @delivery_truck.make, maximumPossibleWeight: @delivery_truck.maximumPossibleWeight, minimumPossibleWeight: @delivery_truck.minimumPossibleWeight, model: @delivery_truck.model, name: @delivery_truck.name, nextMaintenance: @delivery_truck.nextMaintenance, origin: @delivery_truck.origin, originLocation: @delivery_truck.originLocation, payloadEmptyWeight: @delivery_truck.payloadEmptyWeight, requestedArrivalTime: @delivery_truck.requestedArrivalTime, scheduledDepartureTime: @delivery_truck.scheduledDepartureTime, vinNumber: @delivery_truck.vinNumber, weightCapacity: @delivery_truck.weightCapacity, yearAquired: @delivery_truck.yearAquired, yearManufactured: @delivery_truck.yearManufactured } }
    assert_redirected_to delivery_truck_url(@delivery_truck)
  end

  test 'should destroy delivery_truck' do
    assert_difference('DeliveryTruck.count', -1) do
      delete delivery_truck_url(@delivery_truck)
    end

    assert_redirected_to delivery_trucks_url
  end
end
