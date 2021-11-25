require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get homes_dashboard_url
    assert_response :success
  end
end
