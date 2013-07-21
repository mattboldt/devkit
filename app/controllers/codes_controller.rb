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
		@code = Code.new(params[:code])
		respond_to do |format|
			if @code.save
				format.html { puts "saved" }
			else
				format.html { puts "error" }
			end
		end
	end
end
