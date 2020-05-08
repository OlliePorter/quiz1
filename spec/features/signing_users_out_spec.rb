require "rails_helper"

RSpec.feature "Signing out signed-in users" do

  before do
    @john = User.create!(email: "john@example.com", password: "password", role: "super_admin")
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

end
