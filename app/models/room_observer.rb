class RoomObserver < ActiveRecord::Observer
  def after_save(room)
    Occupancy.new(room).update_cache
  end
end
