# spec/factories/todos.rb
FactoryBot.define do
  factory :application do
    name { Faker::Number.number(10) }
  end
end