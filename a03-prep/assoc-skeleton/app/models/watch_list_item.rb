# == Schema Information
#
# Table name: watch_list_items
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  start_date    :date
#  end_date      :date
#  watch_list_id :integer
#

class WatchListItem < ActiveRecord::Base
  belongs_to :company,
    class_name: 'Company',
    primary_key: :id,
    foreign_key: :company_id
  belongs_to :watch_list,
    class_name: 'WatchList',
      primary_key: :id,
      foreign_key: :watch_list_id
end
