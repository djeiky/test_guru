require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badges_index_url
    assert_response :success
  end

  test "should get user_badges" do
    get badges_user_badges_url
    assert_response :success
  end

end
