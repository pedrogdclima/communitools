class ToolsController < ApplicationController
  def show
    @tool = Tool.find(params[:id])
  end

  def create
  end

  def new
  end

  def edit
  end
end
