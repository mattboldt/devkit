ActiveAdmin.register Tool, :as => "Dev Tools" do
    before_filter :only => [:show, :edit, :update, :destroy] do
        @dev_tools = Tool.find_by_url(params[:id])
      end

	  index do
	    column :title
	    column :desc
	    column "Release Date", :created_at
	    column :url
	    column :tag_list
	    default_actions
	  end

	  form :html => { :enctype => "multipart/form-data" } do |f|
	  	f.inputs "Details" do
		  	f.input :title
		  	f.input :desc
		  	f.input :head
		  	f.input :body
		  	f.input :url
		  	f.input :tag_list
		  end
	  	f.buttons
	  end
  controller do
    def permitted_params
      params.permit!
    end
  end
end