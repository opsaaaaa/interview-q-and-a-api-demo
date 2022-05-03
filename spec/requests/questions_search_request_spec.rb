require 'rails_helper'

RSpec.describe "Questions Search Request", type: :request do

  let(:headers) {{
    :ACCEPT => "application/json", 
    :Authorization => 'Token '+create(:tenant).api_key
  }}
  
  let(:body) { JSON.parse(response.body) }
  let(:body_questions) { body['_embedded']['questions'] }  
  let(:body_question_ids) { body_questions.map {|q| q['id']}}
  
  before do 
    create_list :question, 3, private: false
    create :question, private: false, title: 'Query 123 question?'
    create :answer, body: 'Answer 123!', question: create( :question, private: false)
  end

  describe "GET /api/questions/search/:q" do

    context "query with matching records" do
      before { get "/api/questions/search/123", headers: headers }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it { expect(body['_links']).not_to eq nil }
      
      it do
        expect(body_question_ids).to include(Question.find_by(title: 'Query 123 question?').id)
        expect(body_question_ids).to include(Answer.find_by(body: 'Answer 123!').question.id)
      end
    end

    context "query without matching records" do
      before { get "/api/questions/search/no-matching-records", headers: headers }
   
      it { expect(response).to have_http_status(:no_content) }
    end

  end

end
