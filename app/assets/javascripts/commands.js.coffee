# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # TODO: ensure this works for all browsers & key combinations; eg shift
  RETURN_KEY = 13
  
  $('body').delegate '#new_command #command_input', 'keydown', (event) ->
    return unless event.which == RETURN_KEY
    $('#new_command').submit()
    true
