# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validates :user_id, uniqueness: {scope: :contact_id}

  belongs_to :contact
  belongs_to :user
end
