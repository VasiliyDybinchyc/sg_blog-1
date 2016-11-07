module UsersHelper

  def new_map_or_edit
    @geolocation.nil? ? new_user_geolocation_path(@user.id) :
    edit_user_geolocation_path(@user.id, @user.geolocation.id)
  end

end
