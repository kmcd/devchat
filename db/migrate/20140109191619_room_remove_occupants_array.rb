class RoomRemoveOccupantsArray < ActiveRecord::Migration
  def change
    remove_column :rooms, :occupants
  end
end
