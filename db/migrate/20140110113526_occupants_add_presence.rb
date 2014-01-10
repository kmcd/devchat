class OccupantsAddPresence < ActiveRecord::Migration
  def change
    add_column :occupants, :present, :boolean, default:false, index:true
    add_index :occupants, :present
  end
end
