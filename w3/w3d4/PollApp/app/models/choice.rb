# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  text        :text             not null
#  question_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Choice < ActiveRecord::Base
  validates :text, :question_id, presence: true

  belongs_to :question,
    class_name: 'Question',
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    class_name: 'Response',
    primary_key: :id,
    foreign_key: :choice_id
end
