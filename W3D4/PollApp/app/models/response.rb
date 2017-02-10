# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  choice_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :choice_id, presence: true
  validate :not_duplicate_response, :not_author

  belongs_to :respondent,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :choice,
    class_name: 'Choice',
    primary_key: :id,
    foreign_key: :choice_id

  has_one :question,
    through: :choice,
    source: :question

  def not_author
    # cannot respond to your own poll
    errors[:author] << 'no cheating' if is_author?
  end


  def is_author?
    #checks if respondent is author of this poll
    self.choice.question.poll.author.id == self.user_id
  end


  def not_duplicate_response
    errors[:duplicate] << 'no duplicate responses' if respondent_already_answered?
  end

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    self.sibling_responses.exists?(user_id: self.user_id)
  end
end
