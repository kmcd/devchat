$('form').last().replaceWith $( "<%= j render partial:'messages/show' %>" )

$( "<%= j render partial:'commands/new' %>" ).appendTo $('.room')
