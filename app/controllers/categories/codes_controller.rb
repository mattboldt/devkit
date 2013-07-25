class Categories::CodesController < ApplicationController
	def index
		@category = Category.find_by_url(params[:category_id])
		@codes = @category.codes
	end
	def show
		@category = Category.find_by_url(params[:category_id])
		@code = @category.codes.find_by_url(params[:id])
		@code.body = @code.body.html_safe
	end
	# def new
	# 	@category = Category.find_by_url(params[:category_id])
	# 	@codes = @category.codes.build
	# end
	# def create
	# 	@code = Code.new(params[:code])
	# 	respond_to do |format|
	# 		if @code.save
	# 			format.html { puts "saved" }
	# 		else
	# 			format.html { puts "error" }
	# 		end
	# 	end
	# end
	# def edit
	# end
end
