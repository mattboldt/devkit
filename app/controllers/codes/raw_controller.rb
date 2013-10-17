class Codes::RawController < ApplicationController
	layout false
	def show
		@code = Code.find(params[:code_id])
	end
end
