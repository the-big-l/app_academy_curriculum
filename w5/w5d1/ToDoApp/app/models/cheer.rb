# == Schema Information
#
# Table name: cheers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  goal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cheer < ApplicationRecord
end
