require 'rails_helper'

RSpec.describe "Questions Requests", type: :request do

  let(:headers) {{
    :ACCEPT => "application/json", 
    :Authorization => 'Token '+create(:tenant).api_key
  }}
  
  let(:body) { JSON.parse(response.body) }
  let(:body_questions) { body['_embedded']['questions'] }
  let(:links) {body['_links']} 

  before do 
    create_list :question_with_answers, 3, private: false
    create :question_with_answers, private: true
  end

  describe "GET /api/questions" do

    let(:body_question_ids) { body_questions.map {|q| q['id']}}

    before do
      get "/api/questions", headers: headers
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns a list of questions with answers and users" do
      body = JSON.parse(response.body)
      expect(body_questions).to be_an_instance_of Array
      expect(body_questions.first['answers']).to be_an_instance_of Array
      expect(body_questions.first['answers'][0]['user']).to be_an_instance_of Hash
      expect(body_questions.first['user']).to be_an_instance_of Hash
    end

    it "provides question link" do
      expect(body_questions.first['_links']['self']['href']).to match /api\/questions\/\d{1,}/
    end
    
    it "does not return privy/private questions" do
      body.map {}
      Question.privy.select(:id).each do |q|
        expect(body_question_ids).not_to include(q.id)
      end
    end
  end

  describe "GET /api/questions?page=n Pagination" do
    let(:per) { 5 }

    before do 
      create_list :question_with_answers, 11, private: false
    end

    context "first page without page number provided" do
      before {get "/api/questions", headers: headers}
      it {expect(body_questions.size).to eq(per)}
      it {expect(body['count']).to eq(per)}
      it "provides link to pages" do
        expect(links['next']['href']).to match 'page=2'
        expect(links['last']['href']).not_to match 'page=1'
        expect(links['first']['href']).not_to match 'page'
        expect(links['prev']).to eq nil
      end
    end
    
    context "second page" do
      before {get "/api/questions?page=2", headers: headers}
      it "provides previous link" do
        expect(links['prev']['href']).to match 'page=1'
      end
    end

    it "out of range page returns no content" do
      get "/api/questions?page=182", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "GET /api/questions/:id" do
    
    let(:question) {create :question_with_answers, private: false }
    let(:body_question) { body['_embedded']['question'] }
    
    before do
      get "/api/questions/#{question.id}", headers: headers
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns the selected question with user and answers" do
      expect(body_question).to be_an_instance_of Hash
      expect(body_question['user']).to be_an_instance_of Hash
      expect(body_question['user']['id']).to eq question.user.id
      expect(body_question['answers']).to be_an_instance_of Array
      expect(body_question['answers'][0]['user']).to be_an_instance_of Hash
      expect(body_question['title']).to eq question.title
      expect(body_question['id']).to eq question.id
    end
    

    it "does not return privy/private questions" do  
      get "/api/questions/#{Question.privy.first.id}", headers: headers
      expect(response).to have_http_status(:not_found)
    end
  end

end
