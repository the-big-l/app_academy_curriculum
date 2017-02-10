# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Board < ActiveRecord::Base
  belongs_to :company,
    class_name: 'Company',
    primary_key: :id,
    foreign_key: :company_id

  has_many :memberships,
    class_name: 'BoardMembership',
    primary_key: :id,
    foreign_key: :board_id

  has_many :members,
    through: :memberships,
    source: :member

  has_one :exchange,
    through: :company,
    source: :exchange


end
