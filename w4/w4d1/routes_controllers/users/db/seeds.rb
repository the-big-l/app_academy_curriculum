# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
user1 = User.create!(username: 'Scott')
user2 = User.create!(username: 'Leo')
user3 = User.create!(username: 'Comp')

Contact.destroy_all
contact1 = Contact.create!(name: 'Scott', email: "scott@gmail.com", user_id: user1.id)
contact2 = Contact.create!(name: 'Leo', email: "leo@gmail.com", user_id: user2.id)
contact3 = Contact.create!(name: 'Comp', email: "comp@gmail.com", user_id: user3.id)

ContactShare.destroy_all
ContactShare.create!(contact_id: contact1.id, user_id: user2.id)
ContactShare.create!(contact_id: contact1.id, user_id: user3.id)
ContactShare.create!(contact_id: contact2.id, user_id: user1.id)
ContactShare.create!(contact_id: contact2.id, user_id: user3.id)
ContactShare.create!(contact_id: contact3.id, user_id: user1.id)
