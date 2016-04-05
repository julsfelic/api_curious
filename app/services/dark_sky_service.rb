class DarkSkyService
  attr_reader :weather

  def initialize(lat, long)
    @api_key = ENV["DARK_SKY_API_KEY"]
    @host = "https://api.forecast.io/forecast"
    @lat = lat.to_s
    @long = long.to_s
    @weather ||= get_weather(@lat, @long)
  end

  def get(lat, long)
    weather_hash = HTTParty.get(@host + "/" + @api_key + "/" + @lat + "," + @long)
    symbolize(weather_hash)
  end

  def feels_like
    weather[:currently][:apparentTemperature]
  end

  def current_temperature
    weather[:currently][:temperature]
  end

  def current_summary
    weather[:currently][:summary]
  end

  def next_hour_description
    weather[:minutely][:summary]
  end

  def twelve_hour_description
    weather[:hourly][:summary]
  end

  def seven_day_description
    weather[:daily][:summary]
  end

  private

  def get_weather(lat, long)
    get(lat, long)
  end

  def symbolize(hash)
    hash.deep_symbolize_keys!
  end
end

# What would restful routes look like when creating the model?
# For:
# current_weather?
# finding weather by a search?
# next hour?
# next 24hrs?
# etc....
