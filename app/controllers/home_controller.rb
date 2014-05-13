class HomeController < ApplicationController
  def index
    if params[:team]
      @team = params[:team]
    else  
      @team = "Bosnia-Herzegovina"
    end
    @games = Game.home_games(@team)
    @won_games = Game.won_games(@team)
    @lost_games = Game.lost_games(@team)
    @draw_games = Game.draw_games(@team)
    @games_away = Game.away_games(@team)
    @neutral_field_games = Game.neutral_field_games(@team)
  end
end
