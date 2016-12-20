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
    if @user.save
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end
end
