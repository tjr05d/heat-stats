class HomeController < ApplicationController
  def index
    query_params = Stattleship::Params::BasketballGameLogsParams.new
    p query_params
  end
end
