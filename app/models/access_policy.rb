class AccessPolicy
  attr_reader :occupant, :room
  
  def initialize(args)
    @occupant, @room = args[:occupant], args[:room]
  end
  
  def valid?
    return cached_access_policy if cached?
    cache_access_policy
  end
  
  private 
  
  def cache_access_policy
    Rails.cache.write room_accessible_cache_key, occupancy_validity
    occupancy_validity
  end
  
  def occupancy_validity
    @occupancy_validity ||= Occupancy.where(id:occupant, room_id:room).exists?
  end
  
  def cached_access_policy
    Rails.cache.fetch room_accessible_cache_key
  end
  
  def cached?
    Rails.cache.exist? room_accessible_cache_key
  end
  
  def room_accessible_cache_key
    ['room_accessible', occupant, room]
  end
end