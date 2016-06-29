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
              ## This style of seeding won't work with callback functions, 
              ## only works with input from forms.     
                name: "Example Test",
                street: "75 Barracks Rd",
                city: "Water",
                state: "AW", 
                zipcode: "23455",
                #sex: "Male" 
              }
            )

#### Trying to remove the line "team_id: rand(1..4)"
#99.times do |n|
#  User.create!(
#    email: Faker::Internet.safe_email, # "name@example.org"
#    password: 'password',
#    password_confirmation: 'password',
#    team_id: rand(1..4),
#    profile_attributes: {
#      name: Faker::Name.name,
#      street: Faker::Address.street_address,
#      city: Faker::Address.city,
#      state: Faker::Address.state_abbr,
#      zipcode: Faker::Address.zip_code
#    }
#  )
#end


Team.create([{ teamname: "White Angels", teamcolor: "white"},  { teamname: "Blue Panthers", teamcolor: "blue"},
             { teamname: "silver Hawks", teamcolor: "silver"}, { teamname: "Globe Trotters", teamcolor: "red"}])

# works perfectly
### One Can also use 'Team.first.users.create' to create the user for users for the first team 
### and the 'captain_id' becomes 'Team.first.id' "or 'Team.id', if it works"
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
#    team_id: rand(1..4),
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
#    team_id: rand(1..4),
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
#    team_id: rand(1..4),
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    }
  )
end

# Number 4 is not seeding for some weird reason.....
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
#    team_id: rand(1..4),
    profile_attributes: {
      name: Faker::Name.name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code
    }
  )
end

Sport.create(sportname: "100M Race")     #, medal_attributes: { gold_id: Team.first.id, silver_id: Team.third.id, bronze_id: Team.second.id})
Sport.create(sportname: "Soccer")        #, medal_attributes: { gold_id: Team.second.id, silver_id: Team.fourth.id, bronze_id: Team.third.id})
Sport.create(sportname: "Tug of War")    #, medal_attributes: { gold_id: Team.second.id, silver_id: Team.third.id, bronze_id: Team.first.id})
Sport.create(sportname: "Sack Race")    #, medal_attributes: { gold_id: Team.first.id, silver_id: Team.fourth.id, bronze_id: Team.third.id})
Sport.create(sportname: "Relay Race")    #, medal_attributes: { gold_id: Team.fourth.id, silver_id: Team.third.id, bronze_id: Team.second.id})
    


#### The lines below both do the same thing i.e. inverse of one another, giving the same result
#### but since the association is populated in the models, rails automatically seeds the join table,
#### thereby making both lines redundant; adding extra and unneccesary records to the join table.
#Sport.all.each{|sport| sport.teams<< Team.all }
#Team.all.each{ |team| team.sports<< Sport.all }

#Sport.first.medal.create(
  #### Medal has no create function making this function throw an error.
#  gold: Team.first.id, 
#  silver: Team.third.id,
#  bronze: Team.second.id
#  )