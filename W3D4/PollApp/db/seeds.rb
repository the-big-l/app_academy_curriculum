# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
Choice.destroy_all
Response.destroy_all

leo = User.create!(user_name: 'leo')
sof = User.create!(user_name: 'sof')
bob = User.create!(user_name: 'bob')

food_poll = Poll.create!(title: 'best foods', author: leo)
animal_poll = Poll.create!(title: 'most adorable animals', author: sof)
park_poll = Poll.create!(title: 'most beautiful park', author: bob)

f1 = Question.create!(text: 'who serves the best mexican food?', poll_id: food_poll.id)
f2 = Question.create!(text: 'who serves the best italian food?', poll_id: food_poll.id)

a1 = Question.create!(text: 'who serves the best animal food?', poll_id: animal_poll.id)
a2 = Question.create!(text: 'how obsessed is too obsessed with your cat?', poll_id: animal_poll.id)

p1 = Question.create!(text: 'where is the best place to take your cat?', poll_id: park_poll.id)
p2 = Question.create!(text: 'what parks have water slides?', poll_id: park_poll.id)

f1c1 = Choice.create!(text: 'tacos tacos tacos', question_id: f1.id)
f1c2 = Choice.create!(text: 'tropisueno', question_id: f1.id)
f1c3 = Choice.create!(text: 'gordo', question_id: f1.id)

f2c1 = Choice.create!(text: 'soldinis green street restaurant', question_id: f2.id)
f2c2 = Choice.create!(text: 'parbacco', question_id: f2.id)
f2c3 = Choice.create!(text: 'dominos', question_id: f2.id)

a1c1 = Choice.create!(text: 'pet smart', question_id: a1.id)
a1c2 = Choice.create!(text: 'parbacco', question_id: a1.id)
a1c3 = Choice.create!(text: 'pet foods plus', question_id: a1.id)

a2c1 = Choice.create!(text: 'if you feed it parbacco', question_id: a2.id)
a2c2 = Choice.create!(text: 'talking about them all day', question_id: a2.id)
a2c3 = Choice.create!(text: 'when cat pictures are your desktop background', question_id: a2.id)

p1c1 = Choice.create!(text: 'gg park', question_id: p1.id)
p1c2 = Choice.create!(text: 'dolo', question_id: p1.id)
p1c3 = Choice.create!(text: 'presidio', question_id: p1.id)

p2c1 = Choice.create!(text: 'water parks', question_id: p2.id)
p2c2 = Choice.create!(text: 'dolo on special occasions', question_id: p2.id)
p2c3 = Choice.create!(text: 'none obvs', question_id: p2.id)

Response.create!(user_id: leo.id, choice_id: f1c1.id)
Response.create!(user_id: sof.id, choice_id: f1c1.id)
Response.create!(user_id: bob.id, choice_id: f1c2.id)
Response.create!(user_id: sof.id, choice_id: a1c1.id)
Response.create!(user_id: bob.id, choice_id: a2c1.id)
Response.create!(user_id: leo.id, choice_id: p2c3.id)
Response.create!(user_id: bob.id, choice_id: p1c2.id)
