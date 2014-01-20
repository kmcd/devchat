# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@Message =
  poll: ->
    setTimeout @request, 3000

  request: ->
    room_id = $(".room").last().data "room-id"
    last_message_id = $(".room .message").last().data "message-id"
    
    $.ajax url:'/messages/poll', type:'POST', ifModified:true, \
      data:{ room_id:room_id, last_message_id:last_message_id }
    
  # TODO: move to Keyboard handler class
  create: ->
    # TODO: ensure this works for all browsers & key combinations; eg shift
    RETURN_KEY = 13
    
    $('body').delegate '#new_message #message_content', 'keydown', (event) ->
      return unless event.which == RETURN_KEY
      
      # TODO: update previous command before submit to prevent clearing effect
      
      $('#new_message').submit()
      true
      
$(document).ready ->
  Message.poll()
