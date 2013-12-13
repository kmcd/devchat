class RoomCommand
  attr_reader :command, :input, :args
  
  def initialize(input)
    @input = input
  end
  
  def output
    input
  end
end

class MessagesController < ApplicationController
  def show
    @command = RoomCommand.new params[:input]
    
    respond_to do |format|
      format.js
      format.html
    end
  end
end
