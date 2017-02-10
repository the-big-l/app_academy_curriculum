# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :watch_lists,
    class_name: 'WatchList',
    primary_key: :id,
    foreign_key: :user_id

  has_many :watch_list_items,
    through: :watch_lists,
    source: :company
end
