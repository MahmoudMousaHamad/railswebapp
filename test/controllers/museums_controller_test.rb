require 'test_helper'

class MuseumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get museums_index_url
    assert_response :success
  end

  test "should get show" do
    get museums_show_url
    assert_response :success
  end

end
