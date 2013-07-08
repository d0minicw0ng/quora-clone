class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.boolean :is_read, :default => false

      t.timestamps
    end
  end
end
