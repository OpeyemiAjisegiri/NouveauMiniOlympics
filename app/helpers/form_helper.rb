module FormHelper
  def setup_user(user)
    user.profile ||= Profile.new
    user
  end

  def setup_sport(sport)
  	(sport.gold ||= Gold.new) #&& (sport.silver ||= Silver.new) && (sport.bronze ||= Bronze.new)
  	#(medal.gold ||= Gold.new) 
    #sport.medal ||= Medal.new
    sport  	
  end
end