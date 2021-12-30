require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'the dude', email: 'elduderino@gmail.com')
  end

  test "should be valid" do
      assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name shouldn't be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email shouldn't be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[alex@example.com ALEX@example.com ALex@exAMple.com alex@EXAMPLE.org AL-EX3@gmail.COM.net al_ex.vrla@gMail.com.com]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should not accept invalid addresses" do
    invalid_addresses = %w[alex@gmail,com alex@com gmail.com @gmail.com. alexgmail.com foo@bar..com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be lowcased before saving them" do
    new_dude = User.new(name: 'whatever', email:'blaBhbsdfHBJHb@gmail.COM')
    new_dude.save
    assert_equal new_dude.email, new_dude.reload.email.downcase
  end
end
