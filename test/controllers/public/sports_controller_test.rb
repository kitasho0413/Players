require "test_helper"

class Public::SportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_sports_index_url
    assert_response :success
  end
end
