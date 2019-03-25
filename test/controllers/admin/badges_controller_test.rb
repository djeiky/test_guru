require 'test_helper'

class Admin::BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_badges_index_url
    assert_response :success
  end

end
