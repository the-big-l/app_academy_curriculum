# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  private    :boolean
#  title      :string
#  body       :text
#  user_id    :integer
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commenticity
end
