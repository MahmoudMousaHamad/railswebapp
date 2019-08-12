require 'test_helper'

class CollegesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colleges_index_url
    assert_response :success
  end

  test "should get show" do
    get colleges_show_url
    assert_response :success
  end

end
