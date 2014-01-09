class CreateOccupants < ActiveRecord::Migration
  def change
    create_table :occupants do |t|
      t.references :user, index: true
      t.references :room, index: true

      t.timestamps
    end
  end
end
