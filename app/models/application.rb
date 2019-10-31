class Application < ApplicationRecord
	has_many :chats 
	validates :token, presence: true, uniqueness: true
	validates :name , presence: true	
	validates :slug , presence: true
	after_initialize :set_token , if: ->(app) { app.new_record? }

	accepts_nested_attributes_for :chats

  	extend FriendlyId
  	friendly_id :token,  use: :slugged
	
	

	def chat_counting
		self.chats.size
	end

	private

	def set_token
		token = generate_token
		self.token = token
	end


	def generate_token
		loop do
		  token = SecureRandom.hex(10)
		  break token unless Application.where(token: token).exists?
		end
	end
end
