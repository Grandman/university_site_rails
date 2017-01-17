class ModerationsController < ApplicationController
  def index
    @users = User.where(approve: false)
    authorize :moderation
  end

  def create
    User.find(params[:user_id]).update!(approve: true)
    redirect_to '/moderations'
  end
end
