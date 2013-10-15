class DevToolsController < ApplicationController
	def index
		if params[:tag]
			@tools = DevTool.tagged_with(params[:tag])
		else
			@tools = DevTool.all
		end
	end
	def show
		@tool = DevTool.find(params[:id])
		redirect_to_good_slug(@tool) and return if bad_slug?(@tool)
		@tool.head = @tool.head.html_safe
		@tool.body = @tool.body.html_safe
	end
	# def new
	# 	@tool = Tool.new
	# end
	# def create
	# 	@tool = Tool.new(params[:tool])
	# 	respond_to do |format|
	# 		if @tool.save
	# 			format.html { redirect_to @tool }
	# 		else
	# 			format.html { puts "error" }
	# 		end
	# 	end
	# end
	# def edit
	# 	@tool = Tool.find_by_url(params[:id])
	# end
	# def update
	#     @tool = Tool.find_by_url(params[:id])

	#     respond_to do |format|
	# 		if @tool.update_attributes(params[:tool])
	# 			format.html { redirect_to tool_path(@tool) }
	# 		else
	# 			format.html { puts "no!" }
	# 		end
	#     end
	# end
end
