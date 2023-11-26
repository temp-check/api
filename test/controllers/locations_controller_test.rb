require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations([:one, :two, :three].sample)
  end

  test "should get index" do
    get locations_url, as: :json
    assert_response :success
  end

  test "should create location" do
    assert_difference("Location.count") do
      post locations_url, params: { location: { address: @location.address } }, as: :json
    end

    assert_response :created
  end

  test "should show location" do
    get location_url(@location), as: :json
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { error: @location.error, lat: @location.lat, lng: @location.lng, postalcode: @location.postalcode, address: @location.address } }, as: :json
    assert_response :success
  end

  test "should destroy location" do
    assert_difference("Location.count", -1) do
      delete location_url(@location), as: :json
    end

    assert_response :no_content
  end
end
