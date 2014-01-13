# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  # TODO: ensure this works for all browsers & key combinations; eg shift
  RETURN_KEY = 13
  
  $('body').delegate '#new_message #message_content', 'keydown', (event) ->
    return unless event.which == RETURN_KEY
    
    # TODO: update previous command before submit to prevent clearing effect
    
    $('#new_message').submit()
    true
