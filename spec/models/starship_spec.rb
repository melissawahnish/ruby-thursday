require 'rails_helper'

RSpec.describe Starship, type: :model do
  it { should validate_presence_of(:name) }
  it { should accept_nested_attributes_for(:crew_members) }
end
