$('#room_1').append "<%= j render(partial:'message', collection:@messages) %>"

Message.poll()
