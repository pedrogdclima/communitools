class ToolsController < ApplicationController
  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user_id = current_user.id
    if @tool.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  private

  def tool_params
    params.expect(tool: [ :name, :brand, :desc ])
  end
end
