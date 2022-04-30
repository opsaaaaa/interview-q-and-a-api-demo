require 'rails_helper'

RSpec.describe Question, type: :model do
  factory_can_create(:question)

  context "scopes" do
    before  do
      create_list :question, 3, private: true
      create_list :question, 3, private: false
    end

    it "to private questions" do
      Question.privy.each do |q|
        expect(q.private).to be true
      end
    end

    it "to public questions" do |q|
      Question.published.each do |q|
        expect(q.private).to be false
      end
    end

  end
end
