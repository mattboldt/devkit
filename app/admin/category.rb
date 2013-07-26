ActiveAdmin.register Category do
	before_filter :only => [:show, :edit, :update, :destroy] do
        @code_categories = Category.find_by_url(params[:id])
      end
end
