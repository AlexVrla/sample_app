require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jaydee)
  end

  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "jdilla@gmail.com",
                                          password: "beetsbeetsbeets" }}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "jdilla@gmail.com",
                                       password: "beatsbeatsbeats" }}
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, false
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end
end
