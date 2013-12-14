# TODO: update previous command in coffeescript instead of re-rendering
# set readonly & set update ids, timestamps etc.
$('form').last().replaceWith $( "<%= j render partial:'messages/show' %>" )

$( "<%= j render partial:'commands/new' %>" ).appendTo $('.room')
