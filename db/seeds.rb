# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.

puts "creating users..."

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
            admin: true
          )

User.create!(name: "Nasty Nas",
             email: "alexandre.vrla@gmail.com",
             password: "qwerty",
             password_confirmation: "qwerty",
             admin: true
            )

User.create!(name: "James Yancey",
             email: "jdilla@gmail.com",
             password: "beatsbeatsbeats",
             password_confirmation: "beatsbeatsbeats",
            admin: true
          )


# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
              email: email,
              password:              password,
              password_confirmation: password,
            admin: false
          )
end
