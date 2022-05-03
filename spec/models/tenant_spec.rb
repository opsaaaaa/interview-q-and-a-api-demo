require 'rails_helper'

RSpec.describe Tenant, type: :model do
  factory_can_create(:tenant)
end
