FactoryBot.define do
  factory :question do
    title { Faker::Lorem.question }
    private { false }
    user { create :user }
  end
  factory :question_with_answers, parent: :question do
    after :create do |q|
      create_list :answer, 3, question: q
    end
  end
end
