class Step < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :done, inclusion: { in: [true, false] }

  belongs_to :todo

end
