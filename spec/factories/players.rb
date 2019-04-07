FactoryBot.define do
  factory :player do
    name { Faker::FunnyName.unique.two_word_name }
    strength { rand(1..33) }
    speed { rand(1..33) }
    agility { rand(1..33) }
  end
end
