class OccupantPoll
  attr_reader :room, :user, :last_polled_message
  
  # TODO: accept session when same occupant logs in from different devices
  def initialize(args)
    room = args[:room_id]
    user = args[:user_id]
    last_polled_message = args[:last_message_id]
  end
  
  def messages
    return [] unless new_messages?
    last_polled_message! new_messages.last
    new_messages
  end
  
  private
  
  def new_messages
    @new_messages ||= Message.
      joins(occupant: :room, occupant: :user).
      where(occupants: { room_id: room }).
      where.not(occupants: { user_id: user }).
      where('messages.id > ?', last_polled_message ).
      order 'messages.id'
  end
  
  def new_messages?
    last_room_message > last_polled_message
  end
  
  def last_polled_message!(message)
    Rails.cache.write ['last_message', room, user], message.id
  end
  
  def last_room_message
    Rails.cache.fetch(['last_message', room]) || Float::INFINITY
  end
end
