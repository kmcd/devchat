class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.text :output
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
