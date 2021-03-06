class CategoriesController < ApplicationController
	def index
		@categories = Category.find(:all, :include => :codes)
	end
	def show
		@category = Category.find(params[:id])
		@codes = @category.codes
		@code.preview = @code.preview.html_safe
	end
	def new
		@category = Category.new
	end
	def create
		@category = Category.new(params[:category])
		respond_to do |format|
			if @category.save
				format.html { redirect_to @category }
			else
				format.html { puts "error" }
			end
		end
	end
end
