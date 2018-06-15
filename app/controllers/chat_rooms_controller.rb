class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find_by name: params[:name]
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit :name
  end
end
