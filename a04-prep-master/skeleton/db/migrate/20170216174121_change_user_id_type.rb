class ChangeUserIdType < ActiveRecord::Migration
  def change
    change_column :links, :user_id, :integer
  end
end
