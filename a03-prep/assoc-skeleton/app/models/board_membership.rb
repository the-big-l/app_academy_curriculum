# == Schema Information
#
# Table name: board_memberships
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  board_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class BoardMembership < ActiveRecord::Base
  belongs_to :board,
    class_name: 'Board',
    primary_key: :id,
    foreign_key: :board_id

  belongs_to :member,
    class_name: 'Executive',
    primary_key: :id,
    foreign_key: :member_id
end
