class UsersController < ApplicationController
  def show
    @user = current_user
    @weather = Weather.find_by(lat:  @user.latitude,
                               long: @user.longitude)
  end
end
