class CuisinesController < ApplicationController
  before_action :set_cuisine, only: %i[ show edit update destroy ]
  before_action :authorize_model

  # GET /cuisines or /cuisines.json
  def index
    @cuisines = Cuisine.all
  end

  # GET /cuisines/1 or /cuisines/1.json
  def show
  end

  # GET /cuisines/new
  def new
    @cuisine = Cuisine.new
  end

  # GET /cuisines/1/edit
  def edit
  end

  # POST /cuisines or /cuisines.json
  def create
    @cuisine = Cuisine.new(cuisine_params)

    respond_to do |format|
      if @cuisine.save
        format.html { redirect_to cuisine_url(@cuisine), notice: "Cuisine was successfully created." }
        format.json { render :show, status: :created, location: @cuisine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuisines/1 or /cuisines/1.json
  def update
    respond_to do |format|
      if @cuisine.update(cuisine_params)
        format.html { redirect_to cuisine_url(@cuisine), notice: "Cuisine was successfully updated." }
        format.json { render :show, status: :ok, location: @cuisine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cuisine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuisines/1 or /cuisines/1.json
  def destroy
    @cuisine.destroy

    respond_to do |format|
      format.html { redirect_to cuisines_url, notice: "Cuisine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cuisine_params
      params.require(:cuisine).permit(:name, :parent_cuisine_id)
    end

    def authorize_model
      authorize! :manage, ManagedFile
    end
end
