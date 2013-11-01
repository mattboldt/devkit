class Admin::ToolsController < AdminController

  def index
    @tools = Tool.order(sort_column + ' ' + sort_direction)
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:success] = "Tool Created"
      redirect_to admin_tool_path(@tool)
    else
      render "new"
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(tool_params)
      flash[:success] = "tool Edited"
      redirect_to admin_tool_path(@tool)
    else
      render "edit"
    end
  end

  def destroy
    Tool.find(params[:id]).destroy
    flash[:success] = "tool removed"
    redirect_to admin_tools_path
  end


  private
    def sort_column
      Tool.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def tool_params
      params.require(:tool).permit(:name, :body_input, :preview_input, :filetype, :raw, :slug, :tag_list)
    end
end