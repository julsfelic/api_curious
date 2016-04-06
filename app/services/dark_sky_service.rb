class DarkSkyService
  attr_reader :weather

  def initialize
    @_apikey = ENV["DARK_SKY_API_KEY"]
    @_connection = Faraday.new("https://api.forecast.io")
  end

  def weather(params)
    path = "/forecast/#{apikey}/#{params[:lat]},#{params[:long]}"
    parse(connection.get(path))
  end

  private

  def apikey
    @_apikey
  end

  def connection
    @_connection
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
