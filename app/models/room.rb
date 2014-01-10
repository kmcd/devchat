class Room < ActiveRecord::Base
  has_many :occupants
  has_many :messages, through: :occupants
  has_many :users,    through: :occupants
end
