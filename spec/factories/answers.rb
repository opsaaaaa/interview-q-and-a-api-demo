FactoryBot.define do
  factory :answer do
    body { "MyString" }
    user { create :user }
    question { create :question }
  end
end
