class User < ActiveRecord::Base
  has_many :occupancies, class_name:'Occupant'
  has_many :rooms,    through: :occupancies
  has_many :messages, through: :occupancies
end
