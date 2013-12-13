class RoomCommand
  attr_reader :command, :args
  
  def initialize(params)
  end
  
  def output
    "<p class='output'>Lobby</p>"
  end
end

class RoomsController < ApplicationController
  def show
    @command = RoomCommand.new params
    
    respond_to do |format|
      format.js
      format.html
    end
  end
end
