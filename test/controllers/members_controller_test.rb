require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get members_show_url
    assert_response :success
  end

  test "should get index" do
    get members_index_url
    assert_response :success
  end

end
