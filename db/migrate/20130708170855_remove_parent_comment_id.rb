class RemoveParentCommentId < ActiveRecord::Migration
  def change
    remove_column :comments, :parent_comment_id
  end
end
