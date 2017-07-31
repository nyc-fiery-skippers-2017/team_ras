class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, :null => false
      t.references :voter, index: true
      t.references :voteable, :null => false, polymorphic: true, index: true

      t.timestamps
    end
    
    # fun times with rakey
  end
end
