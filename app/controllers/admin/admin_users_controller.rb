class Admin::AdminUsersController < AdminController
  def index
    if admin_user_signed_in?
      @codes = Code.all
    else
      redirect_to new_admin_user_session_path
    end
  end
end
