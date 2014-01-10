class RoomAuthorisation
  attr_reader :occupant, :room
  
  def initialize(args)
    @occupant, @room = args[:occupant], args[:room]
  end
  
  def valid?
    return cached_authorisation if cached?
    cache_authorisation
  end
  
  private 
  
  def cache_authorisation
    Rails.cache.write room_accessible_cache_key, occupancy_validity
    occupancy_validity
  end
  
  def occupancy_validity
    @occupancy_validity ||= Occupant.where(id:occupant, room_id:room).exists?
  end
  
  def cached_authorisation
    Rails.cache.fetch room_accessible_cache_key
  end
  
  def cached?
    Rails.cache.exist? room_accessible_cache_key
  end
  
  def room_accessible_cache_key
    ['room_accessible', occupant, room]
  end
end