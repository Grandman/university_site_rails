class MenusController < ApplicationController
  def edit
    @menu = Menu.first
    authorize @menu
  end

  def update
    @menu = Menu.first
    @menu.update!(params[:menu].permit(:code))
    redirect_to root_path
  end
end
