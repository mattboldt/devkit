class Admin::CodesController < AdminController

  def index
    @codes = Code.order(sort_column + ' ' + sort_direction)
  end

  def show
    @code = Code.find(params[:id])
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      flash[:success] = "Code Created"
      redirect_to admin_code_path(@code)
    else
      render "new"
    end
  end

  def edit
    @code = Code.find(params[:id])
  end

  def update
    @code = Code.find(params[:id])
    if @code.update_attributes(code_params)
      flash[:success] = "Code Edited"
      redirect_to admin_code_path(@code)
    else
      render "edit"
    end
  end

  def destroy
    Code.find(params[:id]).destroy
    flash[:success] = "Code removed"
    redirect_to admin_codes_path
  end

  def preview
    require 'redcarpet'
    preview = params[:code][:body_input]
    # renderer = Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true, :autolink => true)
    renderer = PygmentizeHTML
    extensions = {:autolink => true, :hard_wrap => true, :space_after_headers => true, :highlight => true, :tables => true, :fenced_code_blocks => true, :gh_blockcode => true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    @preview = redcarpet.render preview
    # respond_to do |format|
    #   format.json { render @preview }
    #   format.html { render @preview }
    #   format.js { render @preview }
    # end
    respond_to do |format|
      format.html { render :text => @preview }
    end
  end

  private
    def sort_column
      Code.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def code_params
      params.require(:code).permit(:name, :body_input, :preview_input, :filetype, :raw, :slug, :tag_list)
    end
end