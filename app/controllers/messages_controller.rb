class MessagesController < ApplicationController
	before_action :set_app_and_chat, only: [:create]
	before_action :get_app_and_chat, only: [:show]

	def create
		@message.body = message_params[:body]
	    @message.save
	    messages = @message.body.to_json
		json_response(messages, :created)
	end

	def show
		messages = {number: @message.number, body: @message.body}
		json_response(messages, :ok)
	end

	private

	def message_params
		params.permit(:id, :application_id ,:body, :chat_id)
	end

	def set_app_and_chat
		application = Application.find_by(slug: message_params[:application_id])
		chat = Chat.where(application_id: application.id, slug: message_params[:chat_id]).first
		@message = Message.new(application_id: application.id, chat_id: chat.id)
	end

	def get_app_and_chat
		application = Application.find_by(slug: message_params[:application_id])
		chat = Chat.where(application_id: application.id, slug: message_params[:chat_id]).first
		@message = Message.where(application_id: application.id, chat_id: chat.id, id: message_params[:id]).first
	end
end