# == Schema Information
#
# Table name: benches
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lat         :float
#  lng         :float
#  seating     :integer          default(2), not null
#  picture_url :string
#

FactoryGirl.define do
  factory :bench do
    seating 3
    description 'comfy bench'
    lat 0
    lng 0
  end
end
