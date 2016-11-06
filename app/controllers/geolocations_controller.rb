class GeolocationsController < ApplicationController

  before_action :find_user_id

  def new
    @geolocation = Geolocation.new
  end

  def create
    @geolocation = @user.geolocation.create(geolocation_params)
    @geolocation.save
    redirect_to @user
  end

  def edit
    if current_user?(@user)
      @geolocation = @user.geolocation.find(params[:id])

      @geolocationMap = @user.geolocation.map { |l| [["id", l.id], ["name", l.address],
                                            ["lat", l.lat], ["lng", l.lng]] }
      @hash = Hash[*@geolocationMap.flatten]
    else
      flash[:danger] = "You can't change location anotner user"
      redirect_to @user
    end
  end

  def update
    @geolocation = @user.geolocation.find(params[:id])
    @geolocation.update(geolocation_params)
    redirect_to @user
  end

  private

  def find_user_id
    @user = User.find(params[:user_id])
  end

  def geolocation_params
    params.require(:geolocation).permit(:name, :lat, :lng)
  end
end
