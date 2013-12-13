# Show command output
$( "<%= @command.output.html_safe %>" ).insertAfter '#new_command'

# Append new command prompt
$( "<%= j render partial:'commands/new' %>" ).insertAfter '.output'
