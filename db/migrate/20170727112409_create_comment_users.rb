class CreateCommentUsers < ActiveRecord::Migration
  def change
    create_table :comments_users do |t|
      t.integer :user_id, :null => false
      t.integer :commenter_id, :null => false

      t.timestamps
    end
  end
end
