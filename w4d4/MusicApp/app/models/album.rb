# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  band_id        :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recording_type :string
#

class Album < ActiveRecord::Base
  validates :band_id, :title, presence: true
  validates :recording_type, inclusion: { in: ['Live', 'Studio'],
    message: "%{value} is not a valid recording type." }

  belongs_to :band
  delegate :name, to: :band, prefix: true
  has_many :tracks

  def next_track_no
    self.tracks.maximum(:no).nil? ? 1 : self.tracks.maximum(:no) + 1
  end

end
