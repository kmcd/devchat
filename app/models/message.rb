class Message < ActiveRecord::Base
  belongs_to :occupant
  validates :content, :occupant_id, presence:true
end
