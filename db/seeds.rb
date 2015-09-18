# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#auser = 
User.create!( email: "example@test.org",
              password:              "example",
              password_confirmation: "example", 
              admin: true,
              profile_attributes: {
                name: "Example Test",
                street: "75 Barracks Rd",
                city: "Water",
                state: "AW", 
                zipcode: "23455",
                #sex: "Male" 
              }
            )
#auser.profile.create!( name: "Example Test",
#               street: "75 Barracks Rd",
#               city: "Waterloo",
#               state: "AW", 
#               zipcode: "23455",
#               #sex: "Male"
#                )

#99.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  street = Faker::Address.street_address
#  city = Faker::Address.city
#  state = Faker::Address.state_abbr
#  zipcode = Faker::Address.zip_code
#  password = "password"
#  User.create!(email: email,
#               password:              password,
#               password_confirmation: password,  
#               profile_attributes: {name: name, street: street, city: city, state: state, zipcode: zipcode })
  #n.profile.create!( name: name, street: street, city: city, state: state, zipcode: zipcode ) 
  #n.each { |user| user.profile.create( name: name, street: street, city: city, state: state, zipcode: zipcode) }
#end

99.times do |n|
  User.create!(
    email: Faker::Internet.safe_email, # "name@example.org"
    password: 'password',
    password_confirmation: 'password',
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    }
  )
end