class TempBusinessesController < ApplicationController
  layout "application_front"
  before_action :set_temp_business, only: %i[ show edit update destroy ]

  def demo3
  end

  # GET /temp_businesses or /temp_businesses.json
  def index
    @temp_businesses = TempBusiness.all
    @filter_keywords_to_display = TempBusiness.filter_keywords_to_display
    @js_businesses = @temp_businesses.map{|x| {name: x.name, logo: (x.logo.blank? ? "" : url_for(x.logo)), link: "/temp_businesses/#{x.id}", keywords: x.generate_keywords_for_filter}}.to_json
    @js_filter_keywords_to_display = @filter_keywords_to_display.to_json
  end

  # GET /temp_businesses/1 or /temp_businesses/1.json
  def show
    @filter_keywords_to_display = TempBusiness.filter_keywords_to_display
    @header_buttons = [
      {
        :icon => "glyphicon-arrow-left",
        :link => temp_businesses_path
      }
    ]
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
