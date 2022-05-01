FactoryBot.define do
  factory :answer do
    body { Faker::Lorem.sentence }
    user { create :user }
    question { create :question }
  end
end
