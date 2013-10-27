class AdminController < ApplicationController
  layout "admin"
  before_filter :get_models#, :authenticate_user!
  helper_method :sort_column, :sort_direction

  def get_models
    @codes = Code.all
    @tools = DevTool.all
    @blog_posts = BlogPost.all
  end

  private

    def sort_direction
       %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end