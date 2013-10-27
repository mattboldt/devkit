class Admin::UsersController < AdminController
  def index
  	@users = User.all
  end
  private
    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
end
