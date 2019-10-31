class Chat < ApplicationRecord
	belongs_to :application , counter_cache: true, dependent: :destroy
	validates :number, presence: true, uniqueness: { scope: :application_id	 }
	validates :application_id, presence: true
	validates :number, presence: true
	validates :slug, presence: true
	
	has_many :messages

  	extend FriendlyId
  	friendly_id :number, use: [:slugged, :finders]

  	attr_accessor :application_id

	# def initialize(attributes = {})
	# 	# puts "#{attributes.inspect}"
	#     attributes.each do |name, value|
	#       send("#{name}=", value)
	#     end
 #  end

	after_initialize :set_chat_number , if: ->(chat) { chat.new_record? }
	before_validation :set_chat_number , if: ->(chat) { chat.new_record? && ENV["RAILS_ENV"] == "test" }

	def messages_counting
		self.messages.size
	end


	def set_chat_number
		puts "khaled #{self.application._id} sss"
		if self.application_id
			puts "another khaled1"
			application = Application.find(self.application_id)
			self.number = application.chats_count + 1
			self.slug = number
		end
	end
end
