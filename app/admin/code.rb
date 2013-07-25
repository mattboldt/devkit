ActiveAdmin.register Code do
	before_filter :only => [:show, :edit, :update, :destroy] do
        @code = Code.find_by_url(params[:id])
      end
end
