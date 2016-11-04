class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sg blog!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @geolocation = @user.geolocation.map { |l| [["id", l.id], ["name", l.address], ["lat", l.lat], ["lng", l.lng]] }
    @hash = Hash[*@geolocation.flatten]
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
