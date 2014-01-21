class Speaker
  attr :user_id, :room_id, :message
  
  def initialize(user_id, room_id)
    @user_id, @user_id = user_id, room_id
  end
  
  def say(something)
    return unless something.present?
    create_message something
    message
  end
  
  private
  
  def create_message(input)
    @message = Message.create! user_id:user_id, room_id:room_id, input:input
  end
end
