class RoomsController < ApplicationController
  # TODO: authorisation for user, room
  def show
    @room = Room.find params[:id]
  end
end
