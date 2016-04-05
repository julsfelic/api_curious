class UsersController < ApplicationController
  def show
    @user = current_user
    @weather = DarkSkyService.new(@user.latitude, @user.longitude)
  end
end
