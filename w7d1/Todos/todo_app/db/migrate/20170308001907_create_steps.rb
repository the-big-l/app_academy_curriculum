class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :done, null: false
      t.integer :todo_id, null: false
      t.timestamps null: false
    end
  end
end
