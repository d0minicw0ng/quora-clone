class CreateNotificationsTable < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id, :null => false
      t.integer :activity_id, :null => false
      t.boolean :is_read, :default => false

      t.timestamps
    end
  end
end
