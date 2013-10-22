class SearchController < ApplicationController
	after_filter :set_headers
	def index
		if params[:q].empty?
			@result = "You didn't search for anything"
		end
	end

	def set_headers
		# headers['Access-Control-Allow-Origin'] = '*'
		# headers['Access-Control-Request-Method'] = 'GET'
		headers['X-Frame-Options'] = "ALLOWALL"
	end
end
