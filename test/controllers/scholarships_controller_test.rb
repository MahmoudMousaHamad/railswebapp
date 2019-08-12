require 'test_helper'

class ScholarshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scholarships_index_url
    assert_response :success
  end

  test "should get show" do
    get scholarships_show_url
    assert_response :success
  end

end
