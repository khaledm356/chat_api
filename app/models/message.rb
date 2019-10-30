class Message < ApplicationRecord
	belongs_to :application, dependent: :destroy
	belongs_to :chat,counter_cache: true,  dependent: :destroy

	before_save :set_message_number
	
	def set_message_number
		chat = Chat.where(application_id: application_id, id: chat_id).first
		self.number = chat.messages_count + 1
	end
end
