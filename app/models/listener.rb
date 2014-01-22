class Listener
  include ActiveModel::Validations
  attr_reader :room_id
  validates :room_id, presence:true, numericality:true
  
  def initialize(room_id:nil,message_id:nil)
    @room_id, @message_id = room_id, message_id
  end
  
  def messages
    return [] unless valid?
    Message.where(room_id:room_id).where "id > ?", last_message_id
  end
  
  def messages?
    !messages.empty?
  end
  
  def last_modified_etags
    last_message = messages.last
    { last_modified:last_message.updated_at.utc, etag:last_message }
  end
  
  private
  
  def last_message_id
    @message_id.present? ? @message_id : first_message_in_empty_room
  end
  
  def first_message_in_empty_room
    Message.where(room_id:room_id).maximum(:id) - 1
  end
end
