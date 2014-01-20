class Listener
  include ActiveModel::Validations
  attr_reader :room_id, :last_message_id
  validates :room_id, :last_message_id, presence:true, numericality:true
  
  def initialize(room_id:nil,last_message_id:nil)
    @room_id, @last_message_id = room_id, last_message_id
  end
  
  def messages
    return [] unless valid?
    Message.where(room_id:room_id).where "id > ?", last_message_id
  end
end
