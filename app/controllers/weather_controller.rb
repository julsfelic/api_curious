class WeatherController < ApplicationController
  def create
    data = Geocoder.search(params[:location])
    lat = data.first.data["geometry"]["location"]["lat"]
    long = data.first.data["geometry"]["location"]["lng"]
    render json: DarkSkyService.new(lat, long).get
  end
end
