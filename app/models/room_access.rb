class RoomAccess
  attr_reader :room, :user
  
  def initialize(room:Room.new, user:User.new)
    @room, @user = room, user
  end
  
  def enter
    occupancy.update_attribute :present, true
  end
  
  def exit
    occupancy.update_attribute :present, false
  end
  
  private
  
  def occupancy
    @occupancy ||= Occupant.
      where(user_id:user.id, room_id:room.id).
      first_or_create
  end
end