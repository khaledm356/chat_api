# spec/factories/todos.rb

FactoryBot.define do
  factory :chat do
  	application { Application.first || association(:application) }
  end
end
 #    initialize_with do 
 #      new(application)
	# end
  # end