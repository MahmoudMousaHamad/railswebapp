require 'test_helper'

class CountryReferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get country_references_index_url
    assert_response :success
  end

  test "should get show" do
    get country_references_show_url
    assert_response :success
  end

end
