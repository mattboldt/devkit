class HomeController < ApplicationController
	def index
		@tools = Tool.all
		@codes = Code.all
	end
end
