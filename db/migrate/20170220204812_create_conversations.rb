class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :target_id, null: false
      t.integer :creator_id, null: false
      t.timestamps
    end
  end
end
