class Game < ActiveRecord::Base

  def self.home_games(team)
    self.where('home_team =? AND neutral_field=?',team, 0)
  end

  def self.away_games(team)
    self.where('away_team =? AND neutral_field=?',team, 0)
  end

  def self.neutral_field_games(team)
    neutral_field_as_home = self.where('home_team=? AND neutral_field=?',team,1)
    neutral_field_as_away = self.where('away_team=? AND neutral_field=?',team,1)
    @neutral_field_games = neutral_field_as_home + neutral_field_as_away
    return @neutral_field_games
  end

  def self.won_games(team)
    games_won1 = self.where('home_team=? and home_goals>away_goals', team).count
    games_won2 = self.where('away_team=? and away_goals>home_goals', team).count
    games_won = games_won1 + games_won2;
    return games_won
  end

  def self.lost_games(team)
    games_won1 = self.where('home_team=? and home_goals<away_goals', team).count
    games_won2 = self.where('away_team=? and away_goals<home_goals', team).count
    games_won = games_won1 + games_won2;
    return games_won
  end

  def self.draw_games(team)
    games_won1 = self.where('home_team=? and home_goals=away_goals', team).count
    games_won2 = self.where('away_team=? and away_goals=home_goals', team).count
    games_won = games_won1 + games_won2;
    return games_won
  end
end
