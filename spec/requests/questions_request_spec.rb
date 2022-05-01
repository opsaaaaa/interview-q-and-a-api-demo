require 'rails_helper'

RSpec.describe QuestionsController, type: :request do

  before do 

    create_list :question_with_answers, 3, private: false
  end

  describe "GET /index" do

    let(:question) {create :question_with_answers, private: false }
    it "returns http success" do
      get "/api/v1/questions", headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns a list of questions" do

      get "/api/v1/questions", headers: { "ACCEPT" => "application/json" }
      body = JSON.parse(response.body)
      expect(body).to be_an_instance_of Array
      expect(body[0]['answers']).to be_an_instance_of Array
      expect(body[0]['user']).to be_an_instance_of Hash
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/questions", headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

end
