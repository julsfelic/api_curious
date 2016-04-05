FactoryGirl.define do
  factory :user do
    uid "1234"
    screen_name "julsfelic"
    name "Julian Feliciano"
    location "Denver, CO"
    profile_image_url "https://robohash.org/#{('a'..'z').to_a.shuffle.slice(0..5).join}"
    oauth_token "deepdish"
    oauth_token_secret "secretdeepdish"
  end
end
