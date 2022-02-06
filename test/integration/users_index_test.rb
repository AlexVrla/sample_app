require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:jaydee)
    @non_admin = users(:craven)
  end

  test 'index as admin including pagination and delete links' do
    post login_path, params: { session: { email: "jdilla@gmail.com",
                                       password: "beatsbeatsbeats" }}
    # log_in_as(@admin)
    assert is_logged_in?
    assert @admin.admin?
    get users_path
    assert_template 'users/index'
    assert_select 'img.gravatar', count: 30
    assert_select 'div.pagination', count: 2
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference "User.count", -1 do
      delete user_path(@non_admin)
    end
  end

  test "index as non-admin" do
    post login_path, params: { session: { email: "nicholas.craven@gmail.com",
                                        password: "2barloop" }}
    assert is_logged_in?
    assert_not @non_admin.admin?
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

end
