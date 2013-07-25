ActiveAdmin.register Doc do
	before_filter :only => [:show, :edit, :update, :destroy] do
		@doc = Doc.find_by_url(params[:id])
	end
end
