require "test_helper"

class VisitsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get visits_show_url
    assert_response :success
  end
end
