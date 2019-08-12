require 'test_helper'

class ConferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conferences_index_url
    assert_response :success
  end

  test "should get show" do
    get conferences_show_url
    assert_response :success
  end

end
