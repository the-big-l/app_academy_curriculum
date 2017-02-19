class CreateSub < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :moderator_id, null: false
      t.timestamps null: false
    end

    add_index :subs, :moderator_id
  end
end