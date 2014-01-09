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

class PolledMessage
  attr_reader :room_id, :user_id
  
  def initialize(room_id:0, user_id:0)
    @room_id, @user_id = room_id, user_id
  end
  
  def self.create(message)
    # message = notifable_occupants(message)
    Rails.cache.write new(room_id, user_id).cache_key, true
  end
  
  def fetch(since:3.seconds.ago)
    return [] unless messages = lastest(since)
    expire
    messages
  end
  
  def latest(since:3.seconds.ago)
    return unless available?
    Message.where(room_id:room_id, created_at:since..1.second.from_now).
      where.not user_id:user_id
  end
  
  def cache_key
    ['room', room_id, 'user', user_id]
  end
  
  def available?
    Rails.cache.exist? cache_key
  end
  
  def expire
    Rails.cache.delete cache_key
  end
end
