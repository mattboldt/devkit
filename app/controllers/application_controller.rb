class ApplicationController < ActionController::Base
protect_from_forgery

	def get_nav_links
		@tools = Tool.all
		@codes = Code.all
	end
end
