def login
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "password"
  click_on "Login"
end