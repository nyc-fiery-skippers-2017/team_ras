class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, :null => false
      t.references :responder, index: true
      t.references :question, index: true 

      t.timestamps
    end
  end
end
