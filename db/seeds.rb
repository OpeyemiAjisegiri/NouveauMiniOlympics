# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!( email: "example@test.org",
              password:              "example",
              password_confirmation: "example", 
              admin: true,
              team_id: rand(1..4),       
              # An attempt no to go through "Team.users.create()" for every team.... might end up doing just that
              #team: Team.where(teamname: "White Angels"),
              profile_attributes: {       
              ## This style of seeding won't work with callback functions, only works with input from forms.     
                name: "Example Test",
                street: "75 Barracks Rd",
                city: "Water",
                state: "AW", 
                zipcode: "23455",
                #sex: "Male" 
              }
            )

Team.create([{ teamname: "White Angels", teamcolor: "white"},  { teamname: "Blue Panthers", teamcolor: "blue"},
             { teamname: "silver Hawks", teamcolor: "silver"}, { teamname: "Globe Trotters", teamcolor: "red"}])

Team.first.users.create(   
    email: Faker::Internet.safe_email, 
    password: 'password',
    password_confirmation: 'password',
    captain_id: Team.first.id,
   ##### Hard to replicate the above line in an incremental fashion in a loop
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    })
20.times do |n|
  Team.first.users.create(
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

Team.second.users.create(   
    email: Faker::Internet.safe_email, 
    password: 'password',
    password_confirmation: 'password',
    captain_id: Team.second.id,
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    })
20.times do |n|
  Team.second.users.create(
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

Team.third.users.create(   
    email: Faker::Internet.safe_email, 
    password: 'password',
    password_confirmation: 'password',
    captain_id: Team.third.id,
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    })
20.times do |n|
  Team.third.users.create(
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

Team.fourth.users.create(                  
    email: Faker::Internet.safe_email, 
    password_confirmation: 'password',
    captain_id: Team.fourth.id,
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    })
20.times do |n|
  Team.fourth.users.create(
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

Sport.create([{sportname: "100M Race"},{sportname: "Soccer"},{sportname: "Tug of War"},{sportname: "Sack Race"},{sportname: "Relay Race"}])  
##### Also works, if each one is broken down into "Sport.create(sportname: "Random Name")" though won't have the power of Sport.first et al...

#Sport.first.gold.team_id  =  Team.second.id, Sport.first.silver.team_id = Team.third.id, Sport.first.bronze.team_id = Team.fourth.id
# The above line didnt update the team's foreign keys in the medal's tables. 
# Try Gold.team = Team.second   ......really not different


#### The lines below both do the same thing i.e. inverse of one another, giving the same result
#### but since the association is populated in the models, rails automatically seeds the join table,
#### thereby making both lines redundant; adding extra and unneccesary records to the join table.
#Sport.all.each{|sport| sport.teams<< Team.all }
#Team.all.each{ |team| team.sports<< Sport.all }
