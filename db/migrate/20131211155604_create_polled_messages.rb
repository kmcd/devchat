class CreatePolledMessages < ActiveRecord::Migration
  def change
    create_table :polled_messages do |t|
      t.references :user, index: true
      t.references :room, index: true
      t.text :content

      t.timestamps
    end
  end
end
