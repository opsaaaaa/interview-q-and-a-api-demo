require 'rails_helper'

RSpec.describe "Questions Requests", type: :request do

  let(:headers) {{
    :ACCEPT => "application/json", 
    :Authorization => 'Token '+create(:tenant).api_key
  }}

  before do 
    create_list :question_with_answers, 3, private: false
    create :question_with_answers, private: true
  end

  describe "GET /api/questions" do

    let(:body) { JSON.parse(response.body) }
    let(:body_question_ids) { body.map {|q| q['id']}}

    before do
      get "/api/questions", headers: headers
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns a list of questions with answers and users" do
      body = JSON.parse(response.body)
      expect(body).to be_an_instance_of Array
      expect(body[0]['answers']).to be_an_instance_of Array
      expect(body[0]['answers'][0]['user']).to be_an_instance_of Hash
      expect(body[0]['user']).to be_an_instance_of Hash
    end

    it "does not return privy/private questions" do
      body.map {}
      Question.privy.select(:id).each do |q|
        expect(body_question_ids).not_to include(q.id)
      end
    end
  end

  describe "GET /api/questions/:id" do
    
    let(:question) {create :question_with_answers, private: false }
    let(:body) { JSON.parse(response.body) }
    
    before do
      get "/api/questions/#{question.id}", headers: headers
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns the selected question" do
      expect(body).to be_an_instance_of Hash
      expect(body['user']).to be_an_instance_of Hash
      expect(body['user']['id']).to eq question.user.id
      expect(body['title']).to eq question.title
      expect(body['id']).to eq question.id
    end

    it "does not return privy/private questions" do  
      get "/api/questions/#{Question.privy.first.id}", headers: headers
      expect(response).to have_http_status(:not_found)
    end
  end

end
