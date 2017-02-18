# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
    message: "%{value} is not a status" }
  validates :cat_id, presence: true
  validate :overlapping_approved_requests

  belongs_to :cat

  def approve!
    self.status = "APPROVE"
  end

  private

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: self.cat_id)
      .where("('#{start_date}' - end_date) * (start_date - '#{end_date}') >= 0")
      .where.not(id: self.id)
      .where(status: 'APPROVED')
    #CatRentalRequest.where(cat_id: self.cat_id).where("('#{start_date}' - start_date) <= 0")
  end

  def overlapping_approved_requests
    if overlapping_requests.count > 0
      self.errors[:overlapping_requests] << "This cat already has an overlapping approved request"
    end
  end

end
