require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get leaderboard" do
    get :leaderboard
    assert_response :success
  end

  test "should get feature" do
    get :feature
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
