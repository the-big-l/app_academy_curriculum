class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.boolean :private
      t.string :title
      t.text :body
      t.integer :user_id
      t.boolean :completed

      t.timestamps
    end
  end
end
