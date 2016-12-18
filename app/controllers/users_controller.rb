class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def teacher
    @user = User.new(params.require(:user).permit(:email, :password, :name))
    @user.role = :teacher
    @user.approve = true
    @user.save!
    redirect_to @user
  end
end
