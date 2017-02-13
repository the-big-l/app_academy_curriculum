# == Schema Information
#
# Table name: tag_topics
#
#  id        :integer          not null, primary key
#  tag_topic :text             not null
#

class TagTopic < ActiveRecord::Base
  validates :tag_topic, presence: true, uniqueness: true

  def popular_links
    self.shortened_urls.num_clicks
  end

  has_many :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tag_topic_id

  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url
end
