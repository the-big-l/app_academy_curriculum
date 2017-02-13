class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :text, null: false
      t.integer :question_id, null: false
      t.timestamps
    end
  end
end
