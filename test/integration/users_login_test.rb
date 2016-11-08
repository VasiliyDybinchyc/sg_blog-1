require "test_helper"

class UsersLoginTest < ActiveSupport::TestCase

  def setup
    @user = users(:vasiliy)
  end

  def test_login_with_invalid_information
    visit login_path
    fill_in("session_email", :with => "")
    fill_in("session_password", :with => "")
    click_button "Log in"
    assert page.has_text?("Invalid email/password combination")
    visit root_path
    assert_not page.has_text?("Invalid email/password combination")
  end

  def test_login_with_valid_information
    login(@user)
    assert page.has_text?(@user.email)
  end

end
