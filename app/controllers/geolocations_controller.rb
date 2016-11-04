class GeolocationsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @geolocation = Geolocation.new
  end

  def create
    @user = User.find(params[:user_id])
    @geolocation = @user.geolocation.create(geolocation_params)
    @geolocation.save
    redirect_to @user
  end

  private

  def geolocation_params
    params.require(:geolocation).permit(:name, :lat, :lng)
  end
end
