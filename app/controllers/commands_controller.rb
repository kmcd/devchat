class CommandsController < ApplicationController
  # TODO: Create command in DB
  def create
    respond_to do |format|
      format.js { redirect_to command_url }
    end
  end
  
  private
  
  # TODO: unit test command routing
  def command_url
    case params[:command]
      when /\/room/ ; room_url 1
      when /\/msg/  ; message_url 1
      else          ; message_url 1, params[:command]
    end
  end
end
