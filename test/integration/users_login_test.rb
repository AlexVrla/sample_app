require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "zozo@invalid.com",
                                       password: "foo" }}
    assert_template 'sessions/new'
    assert_not flash.nil?
    get root_path
    assert flash.empty?
  end
  # test "the truth" do
  #   assert true
  # end
end
