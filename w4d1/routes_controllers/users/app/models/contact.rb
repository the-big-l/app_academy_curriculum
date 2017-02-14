# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :user_id, :email, :name, presence: true
  validates :user_id, uniqueness: {scope: :email}

  belongs_to :owner,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'User'

  has_many :contact_shares,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: 'ContactShare'

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable
end
