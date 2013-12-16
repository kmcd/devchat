$('form').last().replaceWith $( "<%= j render(template:'commands/create', formats:[:html]) %>" )
$( "<%= j render partial:'commands/new' %>" ).appendTo $('.room')