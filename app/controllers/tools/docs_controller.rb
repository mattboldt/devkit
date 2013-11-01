class Tools::DocsController < ApplicationController
	def index
		@tool = Tool.find(params[:tool_id])
		@docs = @tool.docs
	end
	def show
		@tool = Tool.find(params[:tool_id])
		@docs = @tool.docs.find(params[:id])
	end
	# def new
	# 	@tool = Tool.find_by_url(params[:tool_id])
	# 	@docs = @tool.docs.build
	# end
	# def create
	# 	@tool = Tool.find_by_url(params[:tool_id])
	# 	@docs = @tool.docs.new(params[:docs])
	# 	respond_to do |format|
	# 		if @docs.save
	# 			format.html { puts "saved" }
	# 		else
	# 			format.html { puts "error" }
	# 		end
	# 	end

	# end
	# def edit
	# end
	# def update
	#     @tool = Tool.find_by_url(params[:tool_id])
	# 	@docs = @tool.docs.update_attributes(params[:docs])
	#     respond_to do |format|
	# 		if @docs.update_attributes(params[:tool])
	# 			format.html { redirect_to tool_doc_path(@tool) }
	# 		else
	# 			format.html { puts "no!" }
	# 		end
	#     end
	# end
end
