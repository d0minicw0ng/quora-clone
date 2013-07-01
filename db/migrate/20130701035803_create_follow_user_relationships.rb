class CreateFollowUserRelationships < ActiveRecord::Migration
  def change
    create_table :follow_user_relationships do |t|
			t.integer :followed_user_id, :null => false
			t.integer :follower_id, :null => false
			
      t.timestamps
    end
  end
end
