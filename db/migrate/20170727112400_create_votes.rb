class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, :null => false
      t.references :voter, index: true
      t.references :voteable, :null => false, polymorphic: true, index: true

      t.timestamps
    end

    add_index :votes, [:voter_id, :voteable_id, :voteable_type], :unique => true
  end
end
