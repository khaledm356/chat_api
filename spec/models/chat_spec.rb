# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
describe Chat, type: :model do

  # it { should validate_uniqueness_of(:number) }
  it { should validate_presence_of(:application_id) }
  it { should validate_presence_of(:slug) }
  it { should belong_to(:application) }
  it { should validate_uniqueness_of(:number).scoped_to(:application_id) }

end