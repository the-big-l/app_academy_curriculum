# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class WatchList < ActiveRecord::Base
  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :watch_lists,
    class_name: 'WatchList',
    primary_key: :id,
    foreign_key: :watch_list_id
end
