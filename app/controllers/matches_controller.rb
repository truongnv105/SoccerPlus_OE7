class MatchesController < ApplicationController
  def index
    @q = Match.ransack params[:q]
    @matches = @q.result
  end
end
