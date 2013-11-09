class CodesController < ApplicationController

  def index
      @codes = Code.find(:all, :order => "created_at DESC")
      @tags = Code.tag_counts_on(:tags).join(", ").split(", ").sort!
  end

  def show
    @code = Code.find(params[:id])
    @tags = Code.tag_counts_on(:tags).join(", ").split(", ").sort!
    redirect_to_good_slug(@code) and return if bad_slug?(@code)
  end

  # def new
  #   @code = Code.new
  # end

  # def edit
  #   @code = Code.find(params[:id])
  # end

  # def update
  # end

  def download
    @code = Code.find(params[:id])
    # Rails.logger.info params.inspect
    @content = @code.raw
    send_data @content,
      :type => 'text',
      :disposition => "attachment; filename=code-#{@code.created_at.to_formatted_s(:db)}.#{@code.filetype}"
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
