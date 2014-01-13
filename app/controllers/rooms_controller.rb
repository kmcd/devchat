class RoomsController < ApplicationController
  def show
    @messages = Transcript.new(room_id:session[:current_room], date:Date.today).
      messages
  end
end
