class CreateQuestionTopicRelationships < ActiveRecord::Migration
  def change
    create_table :question_topic_relationships do |t|
			t.integer :question_id, :null => false
			t.integer :topic_id, :null => false

      t.timestamps
    end
  end
end
