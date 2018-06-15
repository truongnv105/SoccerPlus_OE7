App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $('#message_message').val('');
    return $('#messages-' + data.chat_room_id).append(data.message);
  },
});
