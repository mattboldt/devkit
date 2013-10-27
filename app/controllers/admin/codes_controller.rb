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

  def edit
    @code = Code.find(params[:id])
  end

  def update
    @code = Code.find(params[:id])
    if @code.update_attributes(code_params)
      flash[:success] = "Code Edited"
      redirect_to admin_code_path(@code)
    else
      flash[:notice] = "Error editing code"
      redirect_to admin_code_edit_path(@code)
    end
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
      params.require(:code).permit(:name, :body_input, :filetype, :raw, :slug)
    end
end