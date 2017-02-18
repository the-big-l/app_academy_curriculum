class AddNoColumn < ActiveRecord::Migration
  def change
    add_column :tracks, :no, :integer
  end
end
