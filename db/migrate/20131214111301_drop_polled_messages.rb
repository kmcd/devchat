class DropPolledMessages < ActiveRecord::Migration
  def change
    drop_table :polled_messages
  end
end
