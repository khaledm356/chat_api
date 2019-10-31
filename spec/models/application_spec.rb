# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
describe Application, type: :model do

  it { should validate_uniqueness_of(:token).ignoring_case_sensitivity }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:token) }
end