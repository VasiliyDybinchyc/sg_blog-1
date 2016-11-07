class GeolocationsController < ApplicationController

  before_action :find_user_id

  def new
    @geolocation = Geolocation.new
  end

  def create
    @geolocation = Geolocation.create(geolocation_params)
    @user.geolocation = @geolocation
    redirect_to @user
  end

  def edit
    if current_user?(@user)
      @geolocation = @user.geolocation
    else
      flash[:danger] = "You can't change location anotner user"
      redirect_to @user
    end
  end

  def update
    @geolocation = @user.geolocation
    @geolocation.update(geolocation_params)
    redirect_to @user
  end

  private

  def find_user_id
    @user = User.find(params[:user_id])
  end

  def geolocation_params
    params.require(:geolocation).permit(:lat, :lng)
  end
end
