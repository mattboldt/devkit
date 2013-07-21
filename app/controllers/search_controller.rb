class SearchController < ApplicationController
	def index
		@search = Tool.search do
			fulltext params[:search]
		end
		@tools = @search.results
	end
end
