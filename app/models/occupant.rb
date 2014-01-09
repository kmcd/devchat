class Occupant < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :messages
  
  validates :user, uniqueness:{ scope: :room, message: 'should only enter once' }
end
