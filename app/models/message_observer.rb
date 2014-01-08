class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    notifable_occupants(message).each do |occupant_id|
      Rails.cache.write ['room', message.room_id, 'user', occupant_id], true
    end
  end
  
  private
  
  def notifable_occupants(message)
    occupants(message.room_id) - [ message.user_id ]
  end
  
  def occupants(room_id)
    Rails.cache.fetch(['room_occupants', room_id]) || []
  end
end
