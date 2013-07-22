class ApplicationController < ActionController::Base
protect_from_forgery

	def get_nav_links
		@tools = Tool.all
		@categories = Category.all
	end
end
