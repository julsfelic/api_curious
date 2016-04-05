class DarkSkyService
  attr_reader :weather

  def initialize(lat, long)
    @api_key = ENV["DARK_SKY_API_KEY"]
    @host = "https://api.forecast.io/forecast"
    @lat = lat.to_s
    @long = long.to_s
  end

  def get
    weather_hash = HTTParty.get("#{@host}/#{@api_key}/#{@lat},#{@long}")
    symbolize(weather_hash)
  end

  private

  def symbolize(hash)
    hash.deep_symbolize_keys!
  end
end
