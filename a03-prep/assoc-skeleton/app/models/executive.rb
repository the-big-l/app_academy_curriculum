# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Executive < ActiveRecord::Base
  has_many :memberships,
    class_name: 'BoardMembership',
    primary_key: :id,
    foreign_key: :member_id

  has_many :boards,
    through: :memberships,
    source: :board
end
