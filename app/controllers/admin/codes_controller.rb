class Admin::CodesController < AdminController
  def index
  end
  def show
    @code = Code.find(params[:id])
  end
  def edit
    @code = Code.find(params[:id])
  end
  def new
    @code = Code.new
  end
  def update
    # @code = Code.update_attributes(params[:code])
    "asd"
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
end