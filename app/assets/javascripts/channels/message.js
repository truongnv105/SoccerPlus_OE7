App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    var message_element = $('.message-show').clone();
    $('#message_message').val('');
    message_element.find('.text-muted').text(data.user);
    message_element.find('.content-message').text(data.message);
    message_element.removeClass('message-show hidden');
    return $('#messages-' + data.chat_room_id).append(message_element);
  },
});
