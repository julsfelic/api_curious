require "rails_helper"

feature "Registered user can view dashboard" do
  scenario "they see their dashboard" do
    VCR.use_cassette("user_dashboard") do
      user = FactoryGirl.create(:user)
      page.set_rack_session(user_id: user.id)

      visit root_path
      click_link "My Weather"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("#{user.screen_name} Weather")
    end
  end
end
