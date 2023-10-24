class BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show edit update destroy ]

  # GET /businesses or /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1 or /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses or /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to business_url(@business), notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to business_url(@business), notice: "Business was successfully updated." }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    @business.destroy

    respond_to do |format|
      format.html { redirect_to businesses_url, notice: "Business was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:name, :logo, :business_hours, :catering_hours, :address, :website_link, :contact_name_description, :contact_email, :contact_phone, :menu_link, :offers_delivery, :offers_catering, :vegetarian_options, :vegan_options, :gluten_free_options, :handles_tax_exemption, :handles_small_cater_size, :handles_medium_cater_size, :handles_large_cater_size, :handles_xlarge_cater_size, :small_cater_size_lead_time, :medium_cater_size_lead_time, :large_cater_size_lead_time, :xlarge_cater_size_lead_time, :cater_drop_off, :cater_setup, :cater_full_service, :is_published)
    end
end
