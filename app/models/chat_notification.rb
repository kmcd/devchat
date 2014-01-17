class ChatNotification
  attr_reader :message
  
  def initialize(message)
    @message = message
  end
  
  def enqueue
    # TODO: enqueue - do we want this in the http request cycle?
    redis.zadd room_key, message.created_at.to_i, javascript_transcript_update
  end
  
  private
  
  def redis
    @redis ||= Redis.connect
  end
  
  def room_key
    "room:#{message.room_id}"
  end
  
  def javascript_transcript_update
    # TODO: turn off logging
    ApplicationController.new.
      render_to_string partial:'messages/update', object:message
  end
end
