class CodesController < ApplicationController
	def index
		if params[:tag]
			@codes = Code.tagged_with(params[:tag])
		else
			@codes = Code.all
		end
	end
	def show
		@code = Code.find(params[:id])
		redirect_to_good_slug(@code) and return if bad_slug?(@code)
	end
	def download
		@code = Code.find(params[:id])
		# Rails.logger.info params.inspect
		@content = @code.raw
		send_data @content,
		  :type => 'text',
		  :disposition => "attachment; filename=code-#{@code.created_at.to_formatted_s(:db)}.#{@code.filetype}"
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
