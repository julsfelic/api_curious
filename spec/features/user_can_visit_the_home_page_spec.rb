require "rails_helper"

feature "User can visit the home page" do
  scenario "they see the home page" do
    visit root_path

    expect(page).to have_link("Cyclogenesis", href: root_path)
    within("section.inner") do
      expect(page).to have_content("Cyclogenesis")
      expect(page).to have_content("Your weather, personalized.")
      expect(page).to have_link("Sign in with Twitter", href: twitter_login_path)
    end
    expect(page).to have_content("2016 by JulsFelic")
  end
end
