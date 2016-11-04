require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "password", password_confirmation: "password")
  end

  def test_name_should_be_present
    @user.name = ""
    assert_not @user.valid?
  end

  def test_email_should_be_present
    @user.email = ""
    assert_not @user.valid?
  end

  def test_name_not_too_long
    @user.name = "a"*60
    assert_not @user.valid?
  end

  def test_email_validation_valid_addresses
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  def test_email_validation_invalid_addresses
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  def test_email_addresses_should_be_unique
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.downcase
    @user.save
    assert_not duplicate_user.valid?
  end

  def test_email_addresses_should_be_saved_as_lower_case
    mixed_case_email = "UsEr@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  def test_password_should_be_present
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  def test_password_validation_a_minimum_length
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
