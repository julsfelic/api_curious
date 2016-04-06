require "rails_helper"

feature "Registered user can view current weather on dashboard" do
  xscenario "they see the current weather" do
    user = FactoryGirl.create(:user)
    page.set_rack_session(user_id: user.id)

    visit root_path
    click_link "My Weather"

    expect(page).to have_content("Denver, CO")
    expect(page).to have_content("Right Now")
    # expect(page).to have_content("65 degree symbol?")
  end
end
