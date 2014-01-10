class OccupantPoll
  attr_reader :occupant, :room
  
  def initialize(args)
    @occupant, @room = args[:occupant_id], args[:room_id]
  end
  
  def messages
    return [] unless messages?
    last_polled! new_messages.last
    new_messages
  end
  
  private
  
  def new_messages
    @new_messages ||= Message.
      joins(:occupant).
      where.not( occupant_id: occupant ).
      where(occupants: { room_id: room }).
      where('messages.id > ?', last_polled ).
      order(:id)
  end
  
  def messages?
    Rails.cache.fetch ['messages_available', room]
  end
  
  def last_polled
    Rails.cache.fetch(last_message_cache_key) || 0
  end
  
  def last_polled!(message)
    Rails.cache.write last_message_cache_key, message.id
  end
  
  def last_message_cache_key
    ['last_message', occupant]
  end
end
