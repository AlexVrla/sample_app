require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:nastynas)
  end

  test 'first page should have 30 users' do
    get login_path
    post login_path, params: { session: { email: "jdilla@gmail.com",
                                       password: "beatsbeatsbeats" }}

    assert is_logged_in?
  #  log_in_as(@user)
    get users_path
  #   # assert_redirected_to login_path
    assert_template 'users/index'
    assert_select 'img.gravatar', count: 30
  end

end
