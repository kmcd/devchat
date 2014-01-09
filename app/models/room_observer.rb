class RoomObserver < ActiveRecord::Observer
  def after_save(room)
    # TODO: investigate possible race conditions if cache & db out of sync
    Occupancy.new(room).update_cache
  end
end
