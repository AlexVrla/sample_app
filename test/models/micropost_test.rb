require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:jaydee)
    @micropost = @user.microposts.build(content: 'Lorem ipsum')
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = nil
    assert_not @micropost.valid?
  end
  test "content shouldn't be blank" do
    @micropost.content = ''
    assert_not @micropost.valid?
  end
  test "content shouldn't be longer than 140 char" do
    @micropost.content = 'a'*141
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
