class ToolsController < ApplicationController
	def index
		@tools = Tool.all
	end
	def show
		# @tool = Tool.friendly.find(params[:id])
		# @tool_url = Tool.friendly.find(params[:id])
		@tool = Tool.find_by_url(params[:id])
		@tool.head = @tool.head.html_safe
		@tool.body = @tool.body.html_safe
	end
	def new
		@tool = Tool.new
	end
	def create
		@tool = Tool.new(params[:tool])
		respond_to do |format|
			if @tool.save
				redirect_to @tool
			else
				puts "error"
			end
		end
	end
	def edit
		@tool = Tool.find_by_url(params[:id])
	end
	def update
	    @tool = Tool.find_by_url(params[:id])

	    respond_to do |format|
			if @tool.save
				redirect_to tool_path(@tool)
			else
				redirect_to tool_path(@tool)
			end
	    end
	end
end
