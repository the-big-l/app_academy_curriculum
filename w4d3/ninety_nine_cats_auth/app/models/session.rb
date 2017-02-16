# == Schema Information
#
# Table name: sessions
#
#  id            :integer          not null, primary key
#  session_token :string           not null
#  user_id       :integer          not null
#  device        :string
#  location      :string
#  created_at    :datetime
#  updated_at    :datetime
#

class Session < ActiveRecord::Base
  
end
