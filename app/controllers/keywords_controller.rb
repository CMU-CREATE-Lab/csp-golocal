class KeywordsController < ApplicationController
  before_action :check_authorization
  before_action :set_keyword, only: %i[ edit update destroy ]

  def index
    @keywords = Keyword.all
  end

  def new
    @keyword = Keyword.new
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end

  def create
    @keyword = Keyword.new(keyword_params)

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to keywords_path, notice: "Keyword was successfully created." }
        format.json { render :index, status: :created, location: @keyword }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to keywords_path, notice: "Keyword was successfully updated." }
        format.json { render :index, status: :ok, location: @keyword }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @keyword.destroy

    respond_to do |format|
      format.html { redirect_to keywords_url, notice: "Keyword was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def check_authorization
      authorize! :manage, Keyword
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      @keyword = Keyword.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def keyword_params
      params.require(:keyword).permit(:name, :category)
    end
end
