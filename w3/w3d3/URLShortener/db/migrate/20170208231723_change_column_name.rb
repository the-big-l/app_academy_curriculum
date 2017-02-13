class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :visits, :shortend_url_id, :shortened_url_id
  end
end
