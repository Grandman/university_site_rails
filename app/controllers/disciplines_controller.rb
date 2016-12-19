class DisciplinesController < ApplicationController
  def show
    @discipline = Discipline.find(params[:id])
  end

  def edit
    @discipline = Discipline.find(params[:id])
  end

  def update
    @discipline = Discipline.find(params[:id]).update(params.require(:discipline).permit(:name, :user_id, :page))
    redirect_to @discipline
  end

  def new
    @discipline = Discipline.new
  end

  def create
    @discipline = Discipline.new(params.require(:discipline).permit(:name, :user_id, :page))
    @discipline.save!
    redirect_to @discipline
  end
end
