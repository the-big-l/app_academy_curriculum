class CreateTagTopics < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.text :tag_topic, null: false
    end

    add_index :tag_topics, :tag_topic, unique: true
  end
end
