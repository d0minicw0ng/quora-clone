class CreateFollowQuestionRelationships < ActiveRecord::Migration
  def change
    create_table :follow_question_relationships do |t|
			t.integer :follower_id, :null => false
			t.integer :question_id, :null => false

      t.timestamps
    end
  end
end
