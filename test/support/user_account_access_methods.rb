module UserAccountAccessMethods
  COMMON_PASSWORD = "Passw0rd"

  def log_in(user, password=COMMON_PASSWORD)
    click_on "Login"
    within("#new_user") do
      fill_in "Email", with: user.email
      fill_in "Password", with: password
      click_on "Log in"
    end
  end
end
