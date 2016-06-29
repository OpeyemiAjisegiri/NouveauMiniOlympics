module MedalsHelper
	def gold_teamName(teams, medal)
		if @sport.medal.gold_id == nil 
		  teamname = "TDB"
		else
          @sport.teams.find_by(id: @sport.medal.gold_id).teamname
		end
	end

	def silver_teamName(teams, medal)
		if @sport.medal.silver_id == nil 
		  teamname = "TDB"
		else
          @sport.teams.find_by(id: @sport.medal.silver_id).teamname
		end
	end

	def bronze_teamName(teams, medal)
		if @sport.medal.bronze_id == nil 
		  teamname = "TDB"
		else
          @sport.teams.find_by(id: @sport.medal.bronze_id).teamname
		end
	end
end
