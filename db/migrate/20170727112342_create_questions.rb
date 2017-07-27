class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, :null => false
      t.string :body, :null => false
      t.references :creator, index: true 

      t.timestamps
    end
  end
end
