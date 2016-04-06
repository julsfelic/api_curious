require "rails_helper"
require "support/authentication"

RSpec.configure do |c|
  c.include Authentication
end

feature "Registered user can log in through twitter" do
  before(:each) do
    stub_omniauth
    VCR.configure do |c|
      c.ignore_request do |request|
        request.uri == "http://maps.googleapis.com/maps/api/geocode/json?address=Denver,%20CO&language=en&sensor=false"
      end
    end
  end

  scenario "they see that they are logged in" do
    visit root_path
    click_link("login")

    expect(current_path).to eq(root_path)

    user = User.first

    within("header.masthead") do
      expect(page).to have_content("Welcome, #{user.screen_name}!")
      expect(page).to have_link("My Weather")
      expect(page).to have_link("Log out")
    end
    expect(page).to_not have_css(".cover .lead img")
  end
end
