class CodesController < ApplicationController
	def index
		@codes = Code.all
	end
	def show
		@code = Code.find(params[:id])
	end
	def new
		@code = Code.new
	end
	def create
		@code = Code.new
		respond_to do |format|
			if @code.save
				puts "saved"
			else
				puts "error"
			end
		end
	end
end
