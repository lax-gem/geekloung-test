FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    hobby { "プログラミング" }
    self_introduction { "プログラミングを勉強しています。" }
  end
end
