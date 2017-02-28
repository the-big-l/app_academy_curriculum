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

class Comment < ApplicationRecord
  belongs_to :commenticity, polymorphic: true
  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'

end
