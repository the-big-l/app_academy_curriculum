# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Todo.destroy_all
Todo.create(
  title: "wash car",
  body: "with soap",
  done: false
)
Todo.create(
  title: "Eat food",
  body: "healthy pls",
  done: false
)
Todo.create(
  title: "wash dog",
  body: "without soap",
  done: false
)
