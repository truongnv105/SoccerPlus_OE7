class MessagesController < ApplicationController
  def create
    message = Message.new message_params
    message.user = current_user

    if message.save
      ActionCable.server.broadcast "messages",
        message: message.message,
        user: message.user.name,
        chat_room_id: message.chat_room.id
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit :message, :chat_room_id
  end
end
