require 'test_helper'

class PickupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup = pickups(:one)
  end

  test "should get index" do
    get pickups_url
    assert_response :success
  end

  test "should get new" do
    get new_pickup_url
    assert_response :success
  end

  test "should create pickup" do
    assert_difference('Pickup.count') do
      post pickups_url, params: { pickup: { end_time: @pickup.end_time, start_time: @pickup.start_time } }
    end

    assert_redirected_to pickup_url(Pickup.last)
  end

  test "should show pickup" do
    get pickup_url(@pickup)
    assert_response :success
  end

  test "should get edit" do
    get edit_pickup_url(@pickup)
    assert_response :success
  end

  test "should update pickup" do
    patch pickup_url(@pickup), params: { pickup: { end_time: @pickup.end_time, start_time: @pickup.start_time } }
    assert_redirected_to pickup_url(@pickup)
  end

  test "should destroy pickup" do
    assert_difference('Pickup.count', -1) do
      delete pickup_url(@pickup)
    end

    assert_redirected_to pickups_url
  end
end
