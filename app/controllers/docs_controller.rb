class DocsController < ApplicationController
	def index
		@tool = Tool.find_by_url(params[:tool_id])
		@docs = @tool.docs
	end
	def show
		@tool = Tool.find_by_url(params[:tool_id])
		@docs = @tool.docs.find_by_url(params[:id])
	end
	def new
		@tool = Tool.find_by_url(params[:tool_id])
		@docs = @tool.docs.build
	end
	def create
		@tool = Tool.find_by_url(params[:tool_id])
		@docs = @tool.docs.new(params[:docs])
		respond_to do |format|
			if @docs.save
				puts "saved"
			else
				puts "error"
			end
		end

	end
end
