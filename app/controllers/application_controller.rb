class ApplicationController < ActionController::Base
protect_from_forgery
before_filter :get_global_vars
	def get_global_vars
		@tools = Tool.all
	end
end
