require "rails_helper"

describe DarkSkyService do
  context "#weather" do
    it "returns weather specific to lat, long" do
      VCR.use_cassette("dark_sky_service#weather") do
        service = DarkSkyService.new
        denver_coordinates = { lat: 39.849312, long: -104.673828 }

        weather = service.weather(denver_coordinates)

        expect(weather[:timezone]).to eq("America/Denver")
        expect(weather[:currently][:summary]).to eq("Partly Cloudy")
        expect(weather[:minutely][:icon]).to eq("partly-cloudy-day")
      end
    end
  end
end
