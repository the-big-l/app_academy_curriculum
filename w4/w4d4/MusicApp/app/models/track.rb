# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lyrics     :text
#

class Track < ActiveRecord::Base
  validates :album_id, :title, presence: true

  belongs_to :album
  delegate :title, to: :album, prefix: true

  has_one :band,
    through: :album,
    source: :band
  delegate :name, to: :band, prefix: true
end
