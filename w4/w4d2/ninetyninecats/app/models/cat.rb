# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string           not null
#  sex         :string(1)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  validates :color, inclusion: { in: %w(brown black orange),
  message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F),
  message: "%{value} is not a valid sex" }
  validates :name, presence: true, exclusion: { in: %w(rover fido opie) ,
  message: "%{value} is a dog's name"}

  has_many :cat_rental_requests,
    dependent: :destroy

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end
end
