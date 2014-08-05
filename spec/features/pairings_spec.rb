require 'rails_helper'

feature 'Users can pair' do
  scenario 'A user can record a pairings with another user' do
    create_user
    create_user(
      name: 'Mike',
      email: 'D',
      photo_name: "face-01.jpeg",
      password: 'password',
      password_confirmation: 'password'
    )
    visit root_path
    login

    find(".user_image").click

    expect(page).to have_css("img[@alt='Face 01']")
    two_days_ago = 2.days.ago.to_date
    select two_days_ago.strftime("%Y"), from: "pairing_date_1i"
    select two_days_ago.strftime("%B"), from: "pairing_date_2i"
    select two_days_ago.strftime("%-d"), from: "pairing_date_3i"
    click_on "Create Pairing"

    expect(page).to have_content two_days_ago.strftime("%-m/%-d/%Y")
  end
end