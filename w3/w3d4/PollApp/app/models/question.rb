# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    class_name: 'Poll',
    primary_key: :id,
    foreign_key: :poll_id

  has_many :choices,
    class_name: 'Choice',
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    through: :choices,
    source: :responses

  def results
    result = Hash.new { 0 }

    response_collection = responses.includes(:choice)

    response_collection.each do |res|
      result[res.choice.text] += 1
    end

    result
  end

  def ar_results
    Question
      .joins(:responses)
      .group(:choices)
      .select('choices.text, COUNT(*)')
      .where(id: self.id)
  end

  # <<-SQL, id
  #   SELECT choices.text, COUNT(*)
  #   FROM questions
  #   JOIN choices ON questions.id = choices.question_id
  #   JOIN responses ON choices.id = responses.choice_id
  #   WHERE questions.id = ? -- self.id
  #   GROUP BY choices.id
  # SQL

end
