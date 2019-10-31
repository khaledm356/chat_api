class Message < ApplicationRecord
	belongs_to :application, dependent: :destroy
	belongs_to :chat, counter_cache: true,  dependent: :destroy

	validates :application_id, presence: true
	validates :number, presence: true
	validates :slug, presence: true

	before_create :set_message_number
	validates :number, presence: true, uniqueness: { scope: [:application_id, :chat_id]	 }
	
  	extend FriendlyId
  	friendly_id :number, use: [:slugged, :finders]

	def set_message_number
		chat = Chat.where(application_id: self.application_id, id: self.chat_id).first
		unless chat.nil?
			self.number = chat.messages_count + 1
			self.slug = self.number
		end
	end
end
