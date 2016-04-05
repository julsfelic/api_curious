class UsersController < ApplicationController
  def show
    @user = current_user
    @weather = Weather.new(@user.latitude, @user.longitude)
  end
end
