class Listener
  include ActiveModel::Validations
  attr_reader :room_id, :message_id
  validates :room_id, :message_id, presence:true, numericality:true
  
  def initialize(room_id:nil,message_id:nil)
    @room_id = room_id 
    @message_id = message_id.present? ? message_id : 0
  end
  
  def messages
    return [] unless valid?
    Message.where(room_id:room_id).where "id > ?", message_id
  end
  
  def messages?
    !messages.empty?
  end
  
  def last_modified_etags
    last_message = messages.last
    { last_modified:last_message.updated_at.utc, etag:last_message }
  end
end
