# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
describe Chat, type: :model do

  it { should validate_uniqueness_of(:num) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:number).scoped_to(:application_id) }

end