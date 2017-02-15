# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)
# Cat.create!(name: 'zeroeth', sex: 'M', color: 'brown', birth_date: '2001-02-03')
# Cat.create!(name: 'first', sex: 'F', color: 'brown', birth_date: '2011-12-03')
# Cat.create!(name: 'second', sex: 'M', color: 'orange', birth_date: '2012-02-13')
# Cat.create!(name: 'third', sex: 'F', color: 'black', birth_date: '2004-12-13')
# Cat.create!(name: 'fourth', sex: 'M', color: 'brown', birth_date: '2005-11-05')

CatRentalRequest.create!( cat_id: 1, start_date: '2017-02-05', end_date: '2017-02-11')
CatRentalRequest.create!( cat_id: 1, start_date: '2017-02-09', end_date: '2017-02-14')
CatRentalRequest.create!( cat_id: 1, start_date: '2017-03-05', end_date: '2017-03-15')
