class ApplicationsController < ApplicationController

	before_action :set_app, only: [:show, :update, :destroy]

	def create
	    @application = Application.create(application_params) 
		json_response(@application, :created)
	end

	private

	def application_params
		params.permit(:name, :chat_counts)
	end

	def set_app
	   @application = Application.find(params[:id])
	end
end
