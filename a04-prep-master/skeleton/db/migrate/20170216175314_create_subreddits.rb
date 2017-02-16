class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :name
      t.string :genre
      t.string :founder

      t.timestamps null: false
    end
  end
end
