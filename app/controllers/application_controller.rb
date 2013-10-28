class ApplicationController < ActionController::Base
protect_from_forgery
before_filter :get_global_vars
add_flash_types :error
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
	# unless Rails.application.config.consider_all_requests_local
		rescue_from ActiveRecord::RecordNotFound,
		ActionController::RoutingError,
		ActionController::UnknownController do |exception|
		# ActionController::UnknownAction,
		# ActionController::MethodNotAllowed

		# Put loggers here, if desired.

			# redirect_to four_oh_four_path
			render :file => 'public/404.html', :status => :not_found
		end
	# end
end
