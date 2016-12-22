class DisciplinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @discipline = Discipline.find(params[:id])
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end

  def update
    @discipline = Discipline.find(params[:id])
    if (@discipline.update(params.require(:discipline).permit(:name, :user_id, :page)))
      redirect_to @discipline
    else
      flash[:error] = @discipline.errors.full_messages.to_sentence
      render :edit
    end
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.new(params.require(:discipline).permit(:name, :user_id, :page))
    if @discipline.save
      redirect_to @discipline
    else
      flash[:error] = @discipline.errors.full_messages.to_sentence
      render :new
    end
  end
end
