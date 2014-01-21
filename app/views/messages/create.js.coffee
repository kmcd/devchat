$( '.new.message' ).remove()
$( "<%= j render partial:'message', object:@message %>" ).appendTo $('.room')
$( "<%= j render partial:'new' %>" ).appendTo $('.room')
