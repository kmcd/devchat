class Message < ActiveRecord::Base
  belongs_to :occupant
  validates :content, :occupant_id, presence:true
  
  # TODO: benchmark in-line with business profitabity
  scope :poll, ->(args) do
    joins(occupant: :room, occupant: :user).
      where(occupants: { room_id: args[:room_id] }).
      where.not(occupants: { user_id: args[:user_id] }).
      where 'messages.id > ?', args[:last_message_id]
  end
  
  # TODO: move caching to Service object
  # e.g. MessagePoller.new(user_id, room_id).messages
  def cache_last
    Rails.cache.write ['last_room_message', room_id], id
  end
end
