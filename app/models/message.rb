class Message < ActiveRecord::Base
  # TODO: move to PolledMessage.find room_id, user_id, timestamp
  # TODO: refactor to a wrap-around block
  def self.latest_for_occupant(room_id:0, user_id:0, since:3.seconds.ago)
    return [] unless Rails.cache.exist? ['room', room_id, 'user', user_id]
    
    messages = where(room_id:room_id, created_at:since..1.second.from_now).
      where.not user_id:user_id
    
    Rails.cache.delete ['room', room_id, 'user', user_id]
    messages
  end
end
