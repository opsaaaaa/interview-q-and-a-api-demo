FactoryBot.define do
  factory :tenant do
    name { Faker::Name.name }
    request_count { 1 }
  end
end
