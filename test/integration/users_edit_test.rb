require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jaydee)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                                email: "dude@beats",
                                                password: "beats",
                                                password_confirmation: "beat" }}
    assert_template 'users/edit'
    assert_select 'div.alert', "The form contains 4 errors."
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "J Dilla the Greatest",
                                                email: "jdilla@gmail.com",
                                                password: "beatsbeatsbeats",
                                                password_confirmation: "beatsbeatsbeats" }}
    assert_not flash.empty?
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_template 'users/show'
    @user.reload
    assert_equal @user.name, "J Dilla the Greatest"
    assert_equal @user.email, "jdilla@gmail.com"
  end
end
