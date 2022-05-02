FactoryBot.define do
  factory :tenant do
    name { Faker::Name.name }
    request_count { Faker::Number.within(range: 0..100) }
  end
end
