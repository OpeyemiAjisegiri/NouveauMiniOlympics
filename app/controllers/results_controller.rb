class ResultsController < ApplicationController


  def show
    @teams = Team.all
  	render 'app/views/results/show'
  	#render 'app/views/teams/_results'
  	#redirect_to results_path  --- throws an infinite loop as results show method is called by the route
  	# "/results" and "redirect_to results_path" redirects to "/result" (i.e. results_path == "/results")
  end
end
