class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  validates :input, presence:true
end
