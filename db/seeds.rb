15.times do |n|
  name  = Faker::Name.name
  email = "study-#{n+1}@geek-lounge.com"
  hobby = Faker::Hobby.activity
  self_introduction = Faker::Lorem.sentence
  User.create!(name:  name, email: email, hobby: hobby, self_introduction: self_introduction)
end
