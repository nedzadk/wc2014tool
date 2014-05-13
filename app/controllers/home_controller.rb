class HomeController < ApplicationController
  def index
    if params[:team]
      @team = params[:team]
    else  
      @team = "Bosnia-Herzegovina"
    end
    @games = Game.home_games(@team)
    @games_away = Game.away_games(@team)
    @neutral_field_games = Game.neutral_field_games(@team)
  end
end
