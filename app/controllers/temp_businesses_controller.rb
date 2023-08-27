class TempBusinessesController < ApplicationController
  before_action :set_temp_business, only: %i[ show edit update destroy ]

  def demo3
  end

  # GET /temp_businesses or /temp_businesses.json
  def index
    @temp_businesses = TempBusiness.all
  end

  # GET /temp_businesses/1 or /temp_businesses/1.json
  def show
  end

  # GET /temp_businesses/new
  def new
    @temp_business = TempBusiness.new
  end

  # GET /temp_businesses/1/edit
  def edit
  end

  # POST /temp_businesses or /temp_businesses.json
  def create
    @temp_business = TempBusiness.new(temp_business_params)

    respond_to do |format|
      if @temp_business.save
        format.html { redirect_to temp_business_url(@temp_business), notice: "Temp business was successfully created." }
        format.json { render :show, status: :created, location: @temp_business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @temp_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_businesses/1 or /temp_businesses/1.json
  def update
    respond_to do |format|
      if @temp_business.update(temp_business_params)
        format.html { redirect_to temp_business_url(@temp_business), notice: "Temp business was successfully updated." }
        format.json { render :show, status: :ok, location: @temp_business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @temp_business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_businesses/1 or /temp_businesses/1.json
  def destroy
    @temp_business.destroy

    respond_to do |format|
      format.html { redirect_to temp_businesses_url, notice: "Temp business was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # defaults (for debugging)
  def index_default
    @temp_businesses = TempBusiness.all
  end

  def show_default
    @temp_business = TempBusiness.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_business
      @temp_business = TempBusiness.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temp_business_params
      params.require(:temp_business).permit(:name, :logo, :business_hours, :catering_hours, :address, :website_link, :contact_name_description, :contact_email, :contact_phone, :keywords, :menu_link, :offers_delivery, :offers_catering, :accepts_credit_cards, :vegetarian_options, :vegan_options, :gluten_free_options, gallery: [])
    end
end
