FactoryBot.define do
  factory :question do
    title { Faker::Lorem.question }
    private { Faker::Boolean.boolean }
    user { create :user }
  end
end
