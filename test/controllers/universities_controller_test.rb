require 'test_helper'

class UniversitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get universities_index_url
    assert_response :success
  end

  test "should get show" do
    get universities_show_url
    assert_response :success
  end

end
