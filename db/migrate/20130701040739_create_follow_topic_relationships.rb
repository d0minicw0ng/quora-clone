class CreateFollowTopicRelationships < ActiveRecord::Migration
  def change
    create_table :follow_topic_relationships do |t|
			t.integer :follower_id, :null => false
			t.integer :topic_id, :null => false

      t.timestamps
    end
  end
end
