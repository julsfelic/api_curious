class WeathersController < ApplicationController
  def new
  end

  def create
    data = Geocoder.search(params[:location])
    lat = data.first.data["geometry"]["location"]["lat"]
    long = data.first.data["geometry"]["location"]["lng"]
    render json: DarkSkyService.new.weather(lat: lat, long: long)
  end
end
