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

  context "search" do
    before do 
      create_list :question, 3, private: false
      create :question, private: false, title: 'Query 123 question?'
      create :answer, body: 'Answer 123!', question: create( :question, private: false)
    end

    subject { Question.search('123') }
    it("will query include question.title") {is_expected.to include(Question.find_by(title: 'Query 123 question?'))}
    it("will query include answer.body") {is_expected.to include(Answer.find_by(body: 'Answer 123!').question)}
    it "only includes matching results" do 
      subject.each do |q|
        expect(q.answers.map {|a| a.body}.join(' ')+' '+q.title).to match /123/
      end
    end
  end
end
