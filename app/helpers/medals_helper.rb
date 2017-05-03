module MedalsHelper
	def gold_teamName(teams, medal)
		if @sport.medal.gold == (nil || 0)
		  teamname = "TBD"
		else
          @sport.teams.find_by(id: @sport.medal.gold).teamname
		end
	end

	def silver_teamName(teams, medal)
		if @sport.medal.silver == (nil || 0)
		  teamname = "TBD"
		else
          @sport.teams.find_by(id: @sport.medal.silver).teamname
		end
	end

	def bronze_teamName(teams, medal)
		if @sport.medal.bronze == (nil || 0) 
		  teamname = "TBD"
		else
          @sport.teams.find_by(id: @sport.medal.bronze).teamname
		end
	end
 end