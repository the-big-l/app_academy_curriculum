# == Schema Information
#
# Table name: taggings
#
#  id               :integer          not null, primary key
#  tag_topic_id     :integer          not null
#  shortened_url_id :integer          not null
#

class Tagging < ActiveRecord::Base
  validates :tag_topic_id, :shortened_url_id, presence: true

  belongs_to :tag_topic,
    class_name: 'TagTopic',
    primary_key: :id,
    foreign_key: :tag_topic_id

    belongs_to :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :shortened_url_id
end
