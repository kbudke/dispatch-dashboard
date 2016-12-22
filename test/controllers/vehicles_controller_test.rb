require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test 'should get index' do
    get vehicles_url
    assert_response :success
  end

  test 'should get new' do
    get new_vehicle_url
    assert_response :success
  end

  test 'should create vehicle' do
    assert_difference('Vehicle.count') do
      post vehicles_url, params: { vehicle: { actualWeight: @vehicle.actualWeight, destination: @vehicle.destination, make: @vehicle.make, maximumPossibleWeight: @vehicle.maximumPossibleWeight, minimumPossibleWeight: @vehicle.minimumPossibleWeight, model: @vehicle.model, name: @vehicle.name, origin: @vehicle.origin, vinNumber: @vehicle.vinNumber, yearManufactured: @vehicle.yearManufactured } }
    end

    assert_redirected_to vehicle_url(Vehicle.last)
  end

  test 'should show vehicle' do
    get vehicle_url(@vehicle)
    assert_response :success
  end

  test 'should get edit' do
    get edit_vehicle_url(@vehicle)
    assert_response :success
  end

  test 'should update vehicle' do
    patch vehicle_url(@vehicle), params: { vehicle: { actualWeight: @vehicle.actualWeight, destination: @vehicle.destination, make: @vehicle.make, maximumPossibleWeight: @vehicle.maximumPossibleWeight, minimumPossibleWeight: @vehicle.minimumPossibleWeight, model: @vehicle.model, name: @vehicle.name, origin: @vehicle.origin, vinNumber: @vehicle.vinNumber, yearManufactured: @vehicle.yearManufactured } }
    assert_redirected_to vehicle_url(@vehicle)
  end

  test 'should destroy vehicle' do
    assert_difference('Vehicle.count', -1) do
      delete vehicle_url(@vehicle)
    end

    assert_redirected_to vehicles_url
  end
end
