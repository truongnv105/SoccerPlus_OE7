class TeamsController < ApplicationController
  def index;  end

  def show
    @team = Team.find_by name: params[:name]
    @matches = Match.select_team @team.id
  end
end
