# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  commenticity_type :string
#  commenticity_id   :integer
#  body              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  author_id         :integer
#

FactoryGirl.define do
  factory :comment do
    commenticity nil
    body "MyText"
  end
end
