new_message = $('.new.message')
new_message.hide()
$("#room_<%= listener.room_id %>").append \
  "<%= j render(partial:'message', collection:listener.messages) %>"
new_message.appendTo $('.room')
new_message.show()
Room.scroll_bottom()
