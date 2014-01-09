class Room < ActiveRecord::Base
  has_many :occupants
  has_many :messages, through: :occupants
  has_many :users,    through: :occupants
  
  def enter(user)
    return if occupant? user
    occupants_will_change!
    occupants << user.id
    save
  end
  
  def exit(user)
    return unless occupant? user
    occupants_will_change!
    occupants.delete_if {|occupant_id| occupant_id == user.id }
    save
  end
  
  def occupant?(user)
    occupants.include? user.id
  end
end
