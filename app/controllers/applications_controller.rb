class ApplicationsController < ApplicationController

	before_action :set_app, only: [:show, :update, :destroy]

	
	def index
		message = "asdasdas".to_json
		json_response(message, :ok)
	end


	def create
	    @application = Application.create(application_params) 
	    # byebug
	    application_token = @application.token.to_json
		json_response(application_token, :created)
	end

	def show
		unless @application.nil?
			if @application.chats.any?
		    	message = @application.chats.pluck(:number)
			else
				message = "No Chat that application ".to_json
			end
		else 
			message = "Wrong token ".to_json
		end
		json_response(message, :ok)
	end

	private

	def application_params
		params.permit(:token, :slug, :name)
	end

	def set_app
	   @application = Application.find_by(slug: params[:id])
	end
end
