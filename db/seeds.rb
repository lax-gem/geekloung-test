15.times do |n|
  name  = Faker::Name.name
  email = "study-#{n+1}@geek-lounge.com"
  User.create!(name:  name, email: email)
end
