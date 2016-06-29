module FormHelper
  def setup_user(user)
    user.profile ||= Profile.new
    user
  end

  def setup_sport(sport)
    sport.medal ||= Medal.new
    sport  	
  end
end