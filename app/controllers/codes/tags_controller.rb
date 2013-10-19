class Codes::TagsController < ApplicationController

  def index
    @tags = Code.tag_counts_on(:tags).join(", ").split(", ").sort!

      if params[:tag]

        # sort tags param string alphabetically
        sorted_tags = params[:tag].split("/").sort_by!{ |m| m.downcase }.uniq.join("/")

          # redirect if out of order
          if params[:tag] != sorted_tags
            redirect_to code_tags_path+sorted_tags, status: 301
          else
            @codes = Code.tagged_with(params[:tag].split("/"))
          end

        @params = params[:tag].split("/")
        @tags = @tags-@params

      else
        @codes = Code.find(:all, :order => "updated_at DESC")
      end
  end

end
