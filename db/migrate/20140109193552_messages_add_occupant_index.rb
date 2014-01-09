class MessagesAddOccupantIndex < ActiveRecord::Migration
  def change
    add_index :messages, :occupant_id
  end
end
