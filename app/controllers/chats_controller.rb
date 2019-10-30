class ChatsController < ApplicationController

	before_action :set_app, only: [:create]
	before_action :get_app, only: [:show]
	def get_app_and_chat
		@message = Message.where(application_id: message_params[:application_id], chat_id: message_params[:chat_id], id: message_params[:id]).first
	end

	def create
	    @chat.save
		json_response(@chat, :created)
	end

	def show
		@chat.messages
	end

	private

	def chat_params
		params.permit(:application_id)
	end

	def set_app
		application_id = chat_params[:application_id]
		@chat = Chat.new(application_id: application_id)
	end

	def get_app
		@chat = Chat.where(application_id: chat_params[:application_id]).first
	end
end
