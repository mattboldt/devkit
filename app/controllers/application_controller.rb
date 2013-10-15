class ApplicationController < ActionController::Base
protect_from_forgery
before_filter :get_global_vars
	def get_global_vars
		@tools = DevTool.all
	end

	# check if current slug is not cannonical
	def bad_slug?(object)
		params[:id] != object.to_param
	end
	# 301 redirect to cannonical slug
	def redirect_to_good_slug(object)
		redirect_to params.merge({
				:controller => controller,
				:action => params[:action],
				:id => object.to_param,
				:status => :moved_permanently
			})
	end
end
