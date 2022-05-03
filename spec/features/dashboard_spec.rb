require 'rails_helper'

RSpec.feature "Dashboards", type: :feature do

  before do
    create_list :tenant, 3
    create_list :question, 3, private: false
    create_list :question, 1, private: true
  end

  describe "tenants list" do
    before {visit('/')}
    subject {page}

    it "displays each tenant name and request_count" do
      Tenant.all.each do |t|
        is_expected.to have_content(t.name)
        is_expected.to have_content(t.request_count)
      end
    end

    it "does not display api_keys" do
      Tenant.all.each do |t|
        is_expected.not_to have_content(t.api_key)
      end
    end
  end

  describe "site stats" do
    before {visit('/')}
    subject {page}
    
    it "displays public questions count" do
      is_expected.to have_content(Question.published.count)
    end

    it "displays user count" do
      is_expected.to have_content(User.count)
    end

    it "displays public answer count" do
      is_expected.to have_content(Answer.published.count)
    end
  end

end
