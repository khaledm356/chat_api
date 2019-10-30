class Chat < ApplicationRecord
	belongs_to :application , counter_cache: true, dependent: :destroy
	validates :application_id, uniqueness: { scope: :number }
	has_many :messages
	# validates :number
	# validates :application_id, presence: true

	before_save :set_chat_number

	def messages_counting
		self.messages.size
	end


	def set_chat_number

		# application = Application.find_by_slug(token)
		# self.application_token = application.token
		# self.application_id = application.id

		application = Application.find(application_id)
		puts application.inspect
		self.number = application.chats_count + 1
	end
end
