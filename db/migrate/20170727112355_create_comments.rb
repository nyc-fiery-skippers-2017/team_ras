class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, :null => false
      t.references :commenter, index: true 
      t.references :commentable, :null => false, polymorphic: true, index: true

      t.timestamps
    end
    
    add_index :comments, [:commenter_id, :commentable_id, :commentable_type], :unique => true
  end
end
