class Codes::TagsController < ApplicationController

  def index
    @tags = Code.tag_counts_on(:tags).join(", ").split(", ").sort!

      if params[:tag]

        # sort tags param string alphabetically
        sorted_tags = params[:tag].split("/").sort_by!{ |m| m.downcase }.uniq.join("/")

        @params = params[:tag].split("/")
        @tags = @tags-@params

          # redirect if out of order
          if params[:tag] != sorted_tags
            redirect_to code_tags_path+sorted_tags, status: 301
          else
            @codes = Code.tagged_with(params[:tag].split("/"))
            if !@codes.any?
              redirect_to codes_path, status: 301,
                error: "No Codes under: #{@params.join(', ')}. Sorry! Redirected to all tags."
            end
          end

      else
        @codes = Code.find(:all, :order => "updated_at DESC")
      end
  end

end
