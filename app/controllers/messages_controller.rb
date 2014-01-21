class MessagesController < ApplicationController
  helper_method :listener
  # FIXME: authorisation
  
  def create
    @message = speaker.say params[:message][:input]
  end
  
  def poll
    if listener.messages?
      fresh_when listener.last_modified_etags
    else
      render nothing:true
    end
  end
  
  private
  
  def speaker
    Speaker.new User.first.id, Room.first.id
  end
  
  def listener
    @listener ||= Listener.new room_id:params[:room_id], 
      message_id:params[:message_id]
  end
end
