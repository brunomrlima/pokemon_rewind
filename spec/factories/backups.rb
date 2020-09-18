FactoryBot.define do
  factory :backup do
    raw_json { Faker::Json.shallow_json(width: 3) }
  end
end
