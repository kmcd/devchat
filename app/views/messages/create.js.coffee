$('form').last().replaceWith $( "<%= j render(template:'messages/create', formats:[:html]) %>" )

$( "<%= j render partial:'commands/new' %>" ).appendTo $('.room')
