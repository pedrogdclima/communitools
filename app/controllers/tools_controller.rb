class ToolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tool, only: %i[ show edit update destroy ]
  before_action only: %i[ edit update destroy ] do
    is_current_user_owner
  end

  def show
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

  def destroy
    @tool.destroy
    redirect_to "/"
  end

  def edit
  end

  def update
    if @tool.update(tool_params)
      redirect_to "/"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.expect(tool: [ :name, :brand, :desc ])
  end

  def is_current_user_owner
    if @tool.nil? || @tool.user_id.nil?
      redirect_to users_path , alert: "Tool doesn't exist!"
    elsif @tool.user_id != current_user.id
      redirect_to tool_path(@tool.id), alert: t("error.messages.wrong_user")
    end
  end
end
