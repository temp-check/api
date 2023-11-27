require "test_helper"

class PostalCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postal_code = postal_codes(:one)
  end

  test "should get index" do
    get postal_codes_url, as: :json
    assert_response :success
  end

  test "should create postal_code" do
    assert_difference("PostalCode.count") do
      post postal_codes_url, params: { postal_code: { code: @postal_code.code } }, as: :json
    end

    assert_response :created
  end

  test "should show postal_code" do
    get postal_code_url(@postal_code), as: :json
    assert_response :success
  end

  test "should update postal_code" do
    patch postal_code_url(@postal_code), params: { postal_code: { code: @postal_code.code } }, as: :json
    assert_response :success
  end

  test "should destroy postal_code" do
    assert_difference("PostalCode.count", -1) do
      delete postal_code_url(@postal_code), as: :json
    end

    assert_response :no_content
  end
end
