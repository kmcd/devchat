class Occupant < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :messages
  
  validates :user_id, uniqueness:{ scope: :room_id, message: 'only enter once' }
end
