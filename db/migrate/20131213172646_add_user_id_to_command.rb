class AddUserIdToCommand < ActiveRecord::Migration
  def change
    add_reference :commands, :user, index:true
  end
end
