class HomeController < ApplicationController
  def index
    @latest_game = Team.first.games.last
  end
end
