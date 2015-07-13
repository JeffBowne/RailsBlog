module HomeHelper
  def name_link(user)
    if user.profile.present? 
      link_to user.username, user_profiles_path(user) 
    else
      user.username
    end 
  end
end
