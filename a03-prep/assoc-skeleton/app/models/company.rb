# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string
#  website       :string
#  market_cap    :float
#  ticker_symbol :string
#  created_at    :datetime
#  updated_at    :datetime
#  exchange_id   :integer
#

class Company < ActiveRecord::Base
  belongs_to :exchange,
    class_name: 'Exchange',
    primary_key: :id,
    foreign_key: :exchange_id

  has_one :board,
    class_name: 'Board',
    primary_key: :id,
    foreign_key: :company_id

  has_many :prices,
    class_name: 'Price',
    primary_key: :id,
    foreign_key: :company_id

  has_many :watch_list_items,
    class_name: 'WatchListItem',
    primary_key: :id,
    foreign_key: :company_id

  has_many :watch_lists,
    through: :watch_list_items,
    source: :watch_list

  has_many :watchers,
    through: :watch_lists,
    source: :user
end
