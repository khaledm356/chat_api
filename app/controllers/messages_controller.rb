class MessagesController < ApplicationController
	before_action :set_app_and_chat, only: [:create]
	before_action :get_app_and_chat, only: [:show]

	def create
		@message.body = message_params[:body]
	    @message.save
		json_response(@message, :created)
	end

	def show
		json_response(@message, :ok)
	end

	private

	def message_params
		params.permit(:id,:application_id ,:body, :chat_id)
	end

	def set_app_and_chat
		application_id = message_params[:application_id]
		chat_id = message_params[:chat_id]
		@message = Message.new(application_id: application_id, chat_id: chat_id)
	end

	def get_app_and_chat
		@message = Message.where(application_id: message_params[:application_id], chat_id: message_params[:chat_id], id: message_params[:id]).first
	end
end