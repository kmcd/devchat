last_message = $(".room .message").not(".new").last()
new_message = $( "<%= j render partial:'message', object:@message %>" )
new_message.insertAfter last_message
Room.scroll_bottom()
