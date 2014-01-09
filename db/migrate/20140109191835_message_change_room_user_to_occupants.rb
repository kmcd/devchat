class MessageChangeRoomUserToOccupants < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.remove :user_id
      t.remove :room_id
      t.references :occupant
    end
  end
end
