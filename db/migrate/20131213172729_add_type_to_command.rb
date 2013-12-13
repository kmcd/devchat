class AddTypeToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :type, :string
  end
end
