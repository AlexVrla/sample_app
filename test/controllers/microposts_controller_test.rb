require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jaydee)
    @micropost = microposts(:louder)
  end

  test "should redirect create when not logged in" do
    # assert_not is_logged_in?
    assert_no_difference "Micropost.count" do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference "Micropost.count" do
      delete microposts_path(@micropost)
    end
    assert_redirected_to login_path
  end
end
