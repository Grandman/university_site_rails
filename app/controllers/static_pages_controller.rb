class StaticPagesController < ApplicationController
  before_action :set_static_page, only: [:show, :edit, :update, :destroy]

  # GET /static_pages
  # GET /static_pages.json
  def index
    authorize :static_page
    @static_pages = StaticPage.all
  end

  # GET /static_pages/1
  # GET /static_pages/1.json
  def show
    authorize @static_page
  end

  # GET /static_pages/new
  def new
    @static_page = StaticPage.new
    authorize @static_page
  end

  # GET /static_pages/1/edit
  def edit
    authorize @static_page
  end

  # POST /static_pages
  # POST /static_pages.json
  def create
    @static_page = StaticPage.new(static_page_params)
    authorize @static_page

    respond_to do |format|
      if @static_page.save
        format.html { redirect_to @static_page, notice: 'Страница успешно создана' }
        format.json { render :show, status: :created, location: @static_page }
      else
        format.html { render :new }
        format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /static_pages/1
  # PATCH/PUT /static_pages/1.json
  def update
    authorize @static_page
    respond_to do |format|
      if @static_page.update(static_page_params)
        format.html { redirect_to @static_page, notice: 'Страница успешно обновлена' }
        format.json { render :show, status: :ok, location: @static_page }
      else
        format.html { render :edit }
        format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /static_pages/1
  # DELETE /static_pages/1.json
  def destroy
    authorize @static_page
    @static_page.destroy
    respond_to do |format|
      format.html { redirect_to static_pages_url, notice: 'Страница успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_page
      @static_page = StaticPage.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def static_page_params
      params.require(:static_page).permit(:content, :name, :slug)
    end
end
