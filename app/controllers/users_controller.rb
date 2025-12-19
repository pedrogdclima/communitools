class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def tools
  end
  
  def nearby
    @tools = current_user.nearby_tools
  end

end