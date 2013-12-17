$('form').last().replaceWith $( "<%= j render(template:'rooms/create', formats:[:html]) %>" )

$( "<%= j render partial:'commands/new' %>" ).appendTo $('.room')
