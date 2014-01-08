class DropCommand < ActiveRecord::Migration
  def change
    drop_table :commands
  end
end
