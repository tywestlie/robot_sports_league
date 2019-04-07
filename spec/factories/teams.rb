FactoryBot.define do
  factory :team do
    email { Faker::Internet.unique.email }
    team_name { Faker::Team.unique.name }
    password { Faker::Color.color_name }
  end
end
