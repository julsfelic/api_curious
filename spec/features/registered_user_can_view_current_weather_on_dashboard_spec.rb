require "rails_helper"

feature "Registered user can view current weather on dashboard" do
  scenario "they see the current weather" do
    VCR.use_cassette("current_weather_dashboard") do
      user = FactoryGirl.create(:user)
      page.set_rack_session(user_id: user.id)

      visit root_path
      click_link "My Weather"

      expect(page).to have_content("Denver, CO")
      expect(page).to have_content("Right Now")
      expect(page).to have_content("68°F")
      expect(page).to have_content("Clear * Feels like 68°F")
      expect(page).to have_content("Next Hour")
      expect(page).to have_content("Clear for the hour.")
      expect(page).to have_content("Next 24 Hours")
      expect(page).to have_content("Partly cloudy starting tomorrow afternoon.")
      expect(page).to have_content("Next 7 Days")
      expect(page).to have_content("Light rain on Sunday and Monday, with temperatures peaking at 74°F on Saturday.")
    end
  end
end
