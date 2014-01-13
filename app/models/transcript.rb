class Transcript
  attr_reader :date, :room_id
  
  def initialize(room_id:nil, date:Date.today)
    raise ArgumentError unless room_id
    @room_id, @date = room_id, date
  end
  
  def messages
    Message.joins(:occupant).
      where(messages: { created_at:date_range }).
      where(occupants: { room_id: room_id })
  end
  
  private
  
  def date_range
    return date if date.is_a? Range
    (date.beginning_of_day..Date.today.end_of_day)
  end
end
