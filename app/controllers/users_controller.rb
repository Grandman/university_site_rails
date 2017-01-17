class UsersController < ApplicationController
  def index
    authorize :user
    @users = User.where(role: :teacher)
  end

  def new
    @user = User.new
    authorize @user
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

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.disciplines = []
    @user.destroy!
    redirect_to users_path
  end
end
