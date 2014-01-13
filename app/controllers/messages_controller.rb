class MessagesController < ApplicationController
  def create
    @message = Speaker.new(current_occupant).say params[:message][:content]
  end
end
