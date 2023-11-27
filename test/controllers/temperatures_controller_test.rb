require "test_helper"

class TemperaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temperature = temperatures(:one)
  end

  test "should get index" do
    get temperatures_url, as: :json
    assert_response :success
  end

  test "should create temperature" do
    assert_difference("Temperature.count") do
      post temperatures_url, params: { temperature: { forecast: @temperature.forecast, postal_code: @temperature.postal_code } }, as: :json
    end

    assert_response :created
  end

  test "should show temperature" do
    get temperature_url(@temperature), as: :json
    assert_response :success
  end

  test "should update temperature" do
    patch temperature_url(@temperature), params: { temperature: { forecast: @temperature.forecast, postal_code: @temperature.postal_code } }, as: :json
    assert_response :success
  end

  test "should destroy temperature" do
    assert_difference("Temperature.count", -1) do
      delete temperature_url(@temperature), as: :json
    end

    assert_response :no_content
  end
end
