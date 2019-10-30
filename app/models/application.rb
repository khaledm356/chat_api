class Application < ApplicationRecord
	has_many :chats 
	validates :token, uniqueness: true
	validates :name , presence: true	

	before_create :set_access_token 

	accepts_nested_attributes_for :chats

	def chat_counting
		self.chats.size
	end

	private

	def set_access_token
		self.token = generate_token
	end

	def generate_token
		loop do
		  token = SecureRandom.hex(10)
		  break token unless Application.where(token: token).exists?
		end
	end
end
