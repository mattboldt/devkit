class CodesController < ApplicationController

  def index
      @codes = Code.find(:all, :order => "updated_at DESC")
      @tags = Code.tag_counts_on(:tags).join(", ").split(", ").sort!
  end

  def show
    @code = Code.find(params[:id])
    redirect_to_good_slug(@code) and return if bad_slug?(@code)
  end

  def download
    @code = Code.find(params[:id])
    # Rails.logger.info params.inspect
    @content = @code.raw
    send_data @content,
      :type => 'text',
      :disposition => "attachment; filename=code-#{@code.created_at.to_formatted_s(:db)}.#{@code.filetype}"
  end

end
