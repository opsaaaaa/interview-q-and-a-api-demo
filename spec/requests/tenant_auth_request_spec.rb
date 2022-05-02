require 'rails_helper'

RSpec.describe "Tenant Authorization", type: :request do

  let(:tenant) {create :tenant}
  let(:headers) {{
    :ACCEPT => "application/json", 
    :Authorization => 'Token '+tenant.api_key
  }}
  let(:headers_no_token) {{
    :ACCEPT => "application/json" 
  }}
  let(:headers_wrong_token) {{
    :ACCEPT => "application/json", 
    :Authorization => 'Token wrongtoken'
  }}

  before do 
    create_list :question_with_answers, 2, private: false
  end

  describe "Invalid requests" do
    it "with bad api token are refused" do
      get "/api/questions", headers: headers_wrong_token
      expect(response).to have_http_status(:unauthorized)
    end

    it "with no api token are refused" do
      get "/api/questions", headers: headers_no_token
      expect(response).to have_http_status(:unauthorized)
    end

    it "do not increment request count" do
      count = tenant.request_count
      get "/api/questions", headers: headers_wrong_token
      expect(tenant.request_count).to eq(count)
    end
  end

  describe "Valid requests" do
    it "return successful status" do
      get "/api/questions", headers: headers
      expect(response).to have_http_status(:success) 
    end

    it "increments tenant request count" do
      count = tenant.request_count
      get "/api/questions", headers: headers
      expect(response).to have_http_status(:success) 
      expect(Tenant.find(tenant.id).request_count).to eq(count+1)
    end
  end

end