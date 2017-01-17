class DisciplinesController < ApplicationController
  def index
    authorize :discipline
    @disciplines = Discipline.all
  end

  def show
    @discipline = Discipline.find(params[:id])
  end

  def edit
    @discipline = Discipline.find(params[:id])
    authorize @discipline
  end

  def update
    @discipline = Discipline.find(params[:id])
    authorize @discipline
    if (@discipline.update(params.require(:discipline).permit(:name, :user_id, :page)))
      redirect_to @discipline
    else
      flash[:error] = @discipline.errors.full_messages.to_sentence
      render :edit
    end
  end

  def new
    @discipline = Discipline.new
    authorize @discipline
  end

  def create
    @discipline = Discipline.new(params.require(:discipline).permit(:name, :user_id, :page))
    authorize @discipline
    if @discipline.save
      redirect_to @discipline
    else
      flash[:error] = @discipline.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @discipline = Discipline.find(params[:id])
    authorize @discipline
    @discipline.destroy!
    redirect_to disciplines_path
  end
end
