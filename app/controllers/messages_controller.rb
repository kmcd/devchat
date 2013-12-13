class MessagesController < ApplicationController
  def show
    @message = Message.find params[:id]
    
    respond_to do |format|
      format.js
      format.html
    end
  end
end
