class InformationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "informations"
  end

  def unsubscribed;  end
end
