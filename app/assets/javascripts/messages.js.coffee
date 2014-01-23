# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@Message =
  poll: ->
    setTimeout @request, 3000

  request: ->
    room_id = $(".room").last().data "room-id"
    message_id = $(".room .message").not('.new').last().data "message-id"
    
    ajax = $.ajax url:'/messages/poll', ifModified:true, \
      data:{ room_id:room_id, message_id:message_id }
      
    ajax.done = ( data, textStatus, jqXHR ) ->
      eval(data)
      
    ajax.always = ->
      Message.poll()
      
  sumbit_on_return: ->
    $('body').delegate '#message_input', 'keydown', (event) ->
      return_pressed = event.which == 13
      input_not_blank = /.+/.test $('#message_input').val()
      return unless return_pressed && input_not_blank
      $('#new_message').submit()
      $('#message_input').val ''
      false

$(document).ready ->
  Message.poll()
  Message.sumbit_on_return()
