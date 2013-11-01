class Admin::BlogPostsController < AdminController

  def index
    @blog_posts = BlogPost.order(sort_column + ' ' + sort_direction)
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(code_params)
    if @blog_post.save
      flash[:success] = "Code Created"
      redirect_to admin_code_path(@blog_post)
    else
      render "new"
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update_attributes(code_params)
      flash[:success] = "Code Edited"
      redirect_to admin_code_path(@blog_post)
    else
      render "edit"
    end
  end

  def destroy
    BlogPost.find(params[:id]).destroy
    flash[:success] = "Code removed"
    redirect_to admin_codes_path
  end


  private
    def sort_column
      BlogPost.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def blog_post_params
      params.require(:code).permit(:title, :body_input, :desc, :raw, :slug, :tag_list)
    end

end
