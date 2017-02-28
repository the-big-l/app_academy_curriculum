# == Schema Information
#
# Table name: cheers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  goal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :cheer do
    user_id 1
    goal_id 1
  end
end
