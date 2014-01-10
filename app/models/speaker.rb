class Speaker
  attr :occupant_id
  
  def initialize(occupant_id)
    @occupant_id = occupant_id
  end
  
  def say(something)
    update_cache do
      Message.create occupant_id:occupant_id, content:something
    end
  end
  
  private
  
  def update_cache
    message = yield
    Rails.cache.write ['last_room_message', message.room.id], message.id
    message
  end
end
