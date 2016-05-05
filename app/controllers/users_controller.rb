class UsersController < ApplicationController
  def show
    @user = current_user
    @weather = Weather.find_by(lat:  @user.latitude,
                               long: @user.longitude)
  end

  @user = UserWithWeather.new(current_user)
end

class UserWithWeather < SimpleDelegator
  def initialize(user)
    super(user)
    @lat = user.lat
    @long = user.long
  end

  def weather
    @weather ||= Weather.find_by(lat: @lat, long: @long)
  end
end
