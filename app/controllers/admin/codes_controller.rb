class Admin::CodesController < AdminController
  def index
  end
  def show
    @code = Code.find(params[:id])
  end
end