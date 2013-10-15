ActiveAdmin.register Code do
	before_filter :only => [:show, :edit, :update, :destroy] do
        @code = Code.find(params[:id])
      end
      index do
	    column :name
	    column "Release Date", :created_at
	    column :slug
	    column :tag_list
	    default_actions
	  end
	  show do
	  	attributes_table do
	  	row :name
	    # row "Release Date", :created_at
	    row :slug
	    row :tag_list
	    row :body
		end
	end
	form do |f|
		f.inputs "Details", :multipart => true do
			f.input :name
			f.input :slug
			f.input :preview
			f.input :body
			f.input :tag_list
		end
		f.actions
	end
  controller do
    def permitted_params
      params.permit!
    end
  end
end