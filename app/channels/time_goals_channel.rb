class TimeGoalsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "time_goals"
  end

  def unsubscribed;  end
end
