require 'test_helper'

class IslamicPeriodsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get islamic_periods_show_url
    assert_response :success
  end

  test "should get index" do
    get islamic_periods_index_url
    assert_response :success
  end

end
