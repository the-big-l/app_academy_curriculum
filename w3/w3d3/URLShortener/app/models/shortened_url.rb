# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, uniqueness: true

  include SecureRandom

  def self.random_code
    while true
      code = SecureRandom::urlsafe_base64
      return code unless ShortenedUrl.exists?(short_url: code)
    end
  end

  def self.generate_short_url(user, long_url)
    code = ShortenedUrl.random_code
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: code)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).distinct.where("created_at > ?", 5.minutes.ago).count
  end

  belongs_to :users,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic
end
