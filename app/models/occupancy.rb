class Occupancy
  attr_reader :room
  
  def initialize(room)
    @room = room
  end
  
  def update_cache
    return unless changed?
    Rails.cache.write ['occupants',room], room.occupants
  end
  
  def changed?
    room.occupants != Rails.cache.fetch(['occupants',room])
  end
end