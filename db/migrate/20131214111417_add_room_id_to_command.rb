class AddRoomIdToCommand < ActiveRecord::Migration
  def change
    add_reference :commands, :room, index: true
  end
end
