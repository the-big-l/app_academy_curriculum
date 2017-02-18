# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
end
