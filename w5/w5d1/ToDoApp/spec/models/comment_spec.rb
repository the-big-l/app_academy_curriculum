# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  commenticity_type :string
#  commenticity_id   :integer
#  body              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  author_id         :integer
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
