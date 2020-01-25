require 'test_helper'

class JournalArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get journal_articles_show_url
    assert_response :success
  end

end
