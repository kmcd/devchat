# TODO: update previous command in coffeescript instead of re-rendering
# set readonly & set update ids, timestamps etc.
$('form').last().replaceWith $( "<%= j render(template:'commands/message', formats:[:html]) %>" )

$( "<%= j render partial:'commands/new' %>" ).appendTo $('.room')
