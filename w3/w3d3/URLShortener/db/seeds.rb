# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
ShortenedUrl.delete_all
Visit.delete_all

leo = User.create!(name: "Leo Salat", email: "leo@gmail.com")
steve = User.create!(name: "Steve Kim", email: "steve@gmail.com")

url_1 = ShortenedUrl.generate_short_url(leo, "http://stackoverflow.com/questions/6985222/how-to-clear-whole-database-in-rails-seeds-rb")
url_2 = ShortenedUrl.generate_short_url(steve, "https://github.com/appacademy/curriculum/tree/master/sql/projects/associations_exercise")

Visit.create!(user_id: leo.id, shortened_url_id: url_1.id)
Visit.create!(user_id: leo.id, shortened_url_id: url_1.id)
Visit.create!(user_id: leo.id, shortened_url_id: url_2.id)

Visit.create!(user_id: steve.id, shortened_url_id: url_1.id)
Visit.create!(user_id: steve.id, shortened_url_id: url_1.id)
Visit.create!(user_id: steve.id, shortened_url_id: url_1.id)
Visit.create!(user_id: steve.id, shortened_url_id: url_1.id)
Visit.create!(user_id: steve.id, shortened_url_id: url_1.id)
