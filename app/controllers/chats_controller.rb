class ChatsController < ApplicationController

	before_action :set_app, only: [:create]
	before_action :get_app, only: [:show]

	def create
	    @chat.save
		json_response(@chat, :created)
	end

	def show
		unless @chat.nil?
			unless @chat.messages.any?
				messages = @chat.messages.pluck(:number, :body) 
			else 
				messages = "No messages yet ".to_json
			end
			json_response(messages, :show)
		else
			render json: 
						{
							error: "No such chat route check the chat_number or the applican_token",
							status: 400
						}
		end
	end

	private

	def chat_params
		params.permit(:application_id, :id)
	end

	def set_app
		@application = Application.find_by(slug: params[:application_id])
		@chat = Chat.new(application_id: @application.id)
	end

	def get_app		
		@application = Application.find_by(slug: params[:application_id])
		@chat = Chat.where(application_id: @application.id, slug: chat_params[:id]).first
	end
end
