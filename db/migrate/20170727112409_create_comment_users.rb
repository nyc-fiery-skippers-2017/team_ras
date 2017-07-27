class CreateCommentUsers < ActiveRecord::Migration
  def change
    create_table :comments_users do |t|
      t.references :user, index: true
      t.references :commenter, index: true

      t.timestamps
    end
  end
end
