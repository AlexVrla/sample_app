require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:jaydee)
    @micropost = Micropost.new(content: 'Lorem ipsum', user_id: @user.id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user should be present" do
    @micropost.user = nil
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

end
