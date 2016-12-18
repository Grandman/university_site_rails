class ModerationsController < ApplicationController
  def index
    @users = User.where(approve: false)
  end

  def create
    User.find(params[:user_id]).update!(approve: true)
    redirect_to '/moderations'
  end
end
