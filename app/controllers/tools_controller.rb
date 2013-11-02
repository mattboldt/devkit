class ToolsController < ApplicationController
	def index
		if params[:tag]
			@tools = Tool.tagged_with(params[:tag])
			if !@tools.any?
				redirect_to tools_path, status: 301,
					error: "No tools tagged with #{params[:tag]}"
			end
		else
			@tools = Tool.all
		end
	end
	def show
		@tool = Tool.find(params[:id])
		redirect_to_good_slug(@tool) and return if bad_slug?(@tool)
		@tool.head = @tool.head.html_safe
		@tool.body = @tool.body.html_safe
		@tool.desc = @tool.desc.html_safe
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
