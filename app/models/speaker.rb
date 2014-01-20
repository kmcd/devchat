class Speaker
  attr :user_id, :room_id, :message
  
  def initialize(user_id, room_id)
    @user_id, @user_id = user_id, room_id
  end
  
  def say(something)
    return unless something.present?
    create_message something
    notify_chatters
    update_transcript_history
    message
  end
  
  private
  
  def create_message(input)
    @message = Message.create! user_id:user_id, room_id:room_id, input:input
  end

  def notify_chatters
    ChatNotification.new(message).enqueue
  end
  
  def update_transcript_history
    TranscriptUpdate.new(message).enqueue
  end

end
