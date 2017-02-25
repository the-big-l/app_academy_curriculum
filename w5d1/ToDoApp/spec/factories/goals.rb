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

FactoryGirl.define do
  factory :goal do
    private false
    title "MyString"
    body "MyText"
    user_id 1
    completed false
  end
end
