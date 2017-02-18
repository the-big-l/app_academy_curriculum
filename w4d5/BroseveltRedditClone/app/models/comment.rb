# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  link_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
end
