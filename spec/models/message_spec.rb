# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
describe Message, type: :model do

  it { should validate_presence_of(:application_id) }
  it { should validate_presence_of(:slug) }
  it { should belong_to(:application) }
  it { should belong_to(:chat) }
  it { should validate_uniqueness_of(:number).scoped_to([:application_id, :chat_id,]).ignoring_case_sensitivity }

end