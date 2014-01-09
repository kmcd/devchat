class RoomAddOccupants < ActiveRecord::Migration
  def change
    add_column :rooms, :occupants, :integer, array: true, default: []
  end
end
