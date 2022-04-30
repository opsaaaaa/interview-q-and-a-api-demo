require 'rails_helper'

RSpec.describe Question, type: :model do
  factory_can_create(:question)
end
