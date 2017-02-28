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

require 'rails_helper'

RSpec.describe Cheer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
