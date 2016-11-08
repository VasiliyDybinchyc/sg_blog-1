module UsersHelper

  def new_map_or_edit
    @geolocation.nil? ? new_user_geolocation_path(current_user) :
    edit_user_geolocation_path(current_user, @user.geolocation.id)
  end

end
