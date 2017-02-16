# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'Contact'

  has_many :contact_shares,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'ContactShare',
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :comments, as: :commentable
end
