require "rails_helper"

describe Weather do
  context "::find_by()" do
    it "returns the weather pertaining to the location" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather).to be_kind_of(Weather)
        expect(weather.feels_like).to eq(66.33)
        expect(weather.current_summary).to eq("Partly Cloudy")
      end
    end

    it "returns current summary" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather.current_summary).to eq("Partly Cloudy")
      end
    end

    it "returns current temperature" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather.current_temp).to eq(66.33)
      end
    end

    it "returns what it feels like" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather.feels_like).to eq(66.33)
      end
    end

    it "returns the hour summary" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather.hour_summary).to eq("Partly cloudy for the hour.")
      end
    end

    it "returns the day summary" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather.day_summary).to eq("Partly cloudy later this afternoon.")
      end
    end

    it "return the week summary" do
      VCR.use_cassette("Weather::find_by") do
        weather = Weather.find_by(lat: 39.849312, long: -104.673828)

        expect(weather.week_summary).to eq("Light rain on Sunday and Monday, with temperatures peaking at 75°F on Saturday.")
      end
    end
  end
end
