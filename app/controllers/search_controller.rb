class SearchController < ApplicationController
	after_filter :set_access_control_headers

	def set_access_control_headers
		if header['X-Devkit-Bookmark-Search'] == "4Jo8IzIO6JOLhLznh5dBmKNOzbF316W5QBJCpgaU"
			headers['Access-Control-Allow-Origin'] = '*'
			headers['Access-Control-Request-Method'] = 'GET'
		end
	end
end
