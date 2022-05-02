require 'rails_helper'

RSpec.feature "Dashboards", type: :feature do
  let(:tenants) {create_list :tenant, 3}
  let(:privy_questions) {create_list :question, 2, private: true}
  let(:public_questions) {create_list :question, 3, private: false}

  describe "tenants list" do
    before {visit('/')}
    subject {page}

    it "displays each tenant name and request_count" do
      tenants.each do |t|
        is_expected.to have_content(t.name)
        is_expected.to have_content(t.request_count)
      end
    end

    it "does not display api_keys" do
      tenants.each do |t|
        is_expected.not_to have_content(t.api_key)
      end
    end
  end

  describe "site stats" do
    before {visit('/')}
    subject {page}
    
    it "displays public questions count" do
      is_expected.to have_content(public_questions.size)
    end

    it "displays user count"

    it "displays answer count"
  end

end
