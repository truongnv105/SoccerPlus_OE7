class LiveScoreController < ApplicationController
  def index
    @matches = Match.end_match.page(params[:page]).per Settings.per.limit_match
    @lives = Match.live Settings.live
  end
end
