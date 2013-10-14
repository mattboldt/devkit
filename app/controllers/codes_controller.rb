class CodesController < ApplicationController
	def index
		if params[:tag]
			@codes = Code.tagged_with(params[:tag])
		else
			@codes = Code.all
		end
	end
	def show
		@code = Code.find_by_url(params[:id])
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
