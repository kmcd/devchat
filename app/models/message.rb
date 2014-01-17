class Message < ActiveRecord::Base
  validates :input, presence:true
end
