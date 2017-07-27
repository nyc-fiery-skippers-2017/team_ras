class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, :null => false
      t.integer :commenter_id, :null => false
      t.references :commentable, :null => false, polymorphic: true, index: true

      t.timestamps
    end
  end
end
