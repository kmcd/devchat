$('form#new_message').remove()

$( "<%= j render(partial:'messages/create') %>" ).appendTo $('.room')

$( "<%= j render partial:'messages/new' %>" ).appendTo $('.room')
