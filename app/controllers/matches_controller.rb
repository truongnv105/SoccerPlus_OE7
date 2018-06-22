class MatchesController < ApplicationController
  def index
    @q = Match.start_match.page(params[:page]).per(Settings.per.limit_match).ransack params[:q]
    @matches = @q.result
  end

  def show
    @match = Match.find_by name: params[:name]

    if @match.nil?
      flash[:danger] = t ".match_not_exist"
      redirect_to root_url
    else
      @chatroom = @match.chat_room
      @message = Message.new
      @informations = @match.informations
    end
  end
end
