class CodesController < ApplicationController
	def index
		@tags = Code.tag_counts_on(:tags).join(", ").split(", ")
		if params[:tag]
			sorted_tags = params[:tag].split("/").sort_by!{ |m| m.downcase }.uniq.join("/")
			if params[:tag] != sorted_tags
				redirect_to code_tags_path+sorted_tags, status: 301
			else
				@codes = Code.tagged_with(params[:tag].split("/"))
			end
			@params = params[:tag].split("/")
			@tags = @tags-@params
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
