require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get address" do
    get search_address_url
    assert_response :success
  end
end
