$("#room_<%= listener.room_id %>").append "<%= j render(partial:'message', collection:listener.messages) %>"
