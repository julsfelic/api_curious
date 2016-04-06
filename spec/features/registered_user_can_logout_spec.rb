require "rails_helper"
require "support/authentication"

feature "Registered user can logout" do
  before(:each) do
    VCR.configure do |c|
      c.ignore_request do |request|
        request.uri == "http://maps.googleapis.com/maps/api/geocode/json?address=Denver,%20CO&language=en&sensor=false"
      end
    end
  end

  scenario "they are logged out" do
    user = FactoryGirl.create(:user)
    page.set_rack_session(user_id: user.id)

    visit root_path
    click_link "Log out"

    expect(current_path).to eq(root_path)
    expect(page).to have_css("#login")
    expect(page).to have_content("You have been logged out")
    expect(page).to_not have_link("Log out")
    expect(page).to_not have_link("My Weather")
  end
end
