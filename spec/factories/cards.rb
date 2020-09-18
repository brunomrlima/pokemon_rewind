FactoryBot.define do
  factory :card do
    association :backup
    association :rarity
    name { Faker::Name.name }
    image_url { Faker::Name.name }
    image_url_hires { Faker::Name.name }
    description { Faker::Name.name }
    national_pokedex_number { Faker::Number.number }
    evolves_from { Faker::Name.name }
    hp { Faker::Number.number }
  end
end
