require "test_helper"

class UserAccountAccessTest < Capybara::Rails::TestCase
  include UserAccountAccessMethods

  test "signing up" do
    visit root_path
    refute_content page, "Logout"

    click_on "Signup"

    assert_difference("User.count") do
      within("#new_user") do
        fill_in "Email", with: "test@tester.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on "Sign up"
      end
    end

    assert_content page, "Welcome! You have signed up successfully."
  end

  test "logging in" do
    visit root_path
    refute_content page, "Logout"

    click_on "Login"

    within("#new_user") do
      fill_in "Email", with: users(:pdawczak).email
      fill_in "Password", with: UserAccountAccessMethods::COMMON_PASSWORD
      click_on "Log in"
    end

    assert_content page, "Signed in successfully."
  end

  test "logging out" do
    visit root_path

    log_in users(:pdawczak)

    click_on "Log out"
    assert_content page, "Signed out successfully."
  end
end
