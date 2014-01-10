class Message < ActiveRecord::Base
  belongs_to :occupant
  has_one :room, through: :occupant
  validates :content, :occupant_id, presence:true
end
