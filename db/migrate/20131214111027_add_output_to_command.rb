class AddOutputToCommand < ActiveRecord::Migration
  def change
    add_column :commands, :output, :text
  end
end
