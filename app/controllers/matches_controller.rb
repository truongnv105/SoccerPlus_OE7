class MatchesController < ApplicationController
  def index
    @q = Match.start_match.page(params[:page]).per(Settings.per.limit_match).
         ransack params[:q]
    @matches = @q.result
  end
end
