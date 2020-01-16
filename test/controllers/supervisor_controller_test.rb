require 'test_helper'

class SupervisorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get supervisor_show_url
    assert_response :success
  end

end
