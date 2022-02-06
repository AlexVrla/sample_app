require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jaydee)
    @other_user = users(:craven)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_path
  end

  test "should not allow the admin attribute to be edited via the web" do

    post login_path, params: { session: { email: "nicholas.craven@gmail.com",
                                       password: "2barloop" }}
    assert is_logged_in?
    assert_not @other_user.admin?
    patch user_path(@other_user), params: { user: { email: "nicholas.craven@gmail.com",
                                                    password: "2barloop",
                                              password_confirmation: "2barloop",
                                                    admin: true }}
    assert_not @other_user.reload.admin?
  end
end
