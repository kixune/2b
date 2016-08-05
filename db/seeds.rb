# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "gemperor", email: "king@booboo.com", password: "xxxxxx", password_confirmation: "xxxxxx", admin: true)

User.create(name: "badguy", email: "badguy@people.com", password: "badbad", password_confirmation: "badbad")
