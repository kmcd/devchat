$('form.new_message').last().hide()

$( "<%= j render(partial:'messages/create') %>" ).appendTo $('.room')

$( "<%= j render partial:'messages/new' %>" ).appendTo $('.room')
