class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :commenticity, polymorphic: true
      t.text :body

      t.timestamps
    end

    add_index :comments, :commenticity_id
  end
end
