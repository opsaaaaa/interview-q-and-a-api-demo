require 'rails_helper'

RSpec.describe Answer, type: :model do
  factory_can_create(:answer)
  
  context "scopes" do
    before  do
      create_list :question, 2, private: true
      create_list :question, 2, private: false
    end

    it "to private questions" do
      Answer.privy.includes(:question).each do |a|
        expect(a.question.private).to be true
      end
    end

    it "to public questions" do |q|
      Answer.published.includes(:question).each do |a|
        expect(a.question.private).to be false
      end
    end

  end
end
