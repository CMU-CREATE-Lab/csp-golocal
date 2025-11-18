class Admin::BusinessesController < ApplicationController

  layout "application_back"

  before_action :set_business, only: %i[ show edit edit_gallery update destroy ]
  before_action :authorize_model

  def index
    @businesses_published = Business.where(:is_published => true).order('LOWER(name) ASC')
    @businesses_unpublished = Business.where(:is_published => false).order('LOWER(name) ASC')
  end
  
  def new
    @business = Business.new
  end
  
  def edit
  end
  
  def edit_gallery
    render "edit_gallery"
  end

  def create
    @business = Business.new(business_params)
    respond_to do |format|
      if @business.save
        format.html { redirect_to admin_businesses_path, notice: "Business was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to admin_businesses_path, notice: "Business was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy

    respond_to do |format|
      format.html { redirect_to admin_businesses_path, notice: "Business was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business)
        .permit(
          :name, 
          :headline_description, 
          :delivery_information, 
          :logo, 
          :business_hours, 
          :catering_hours, 
          :address, 
          :website_link, 
          :contact_name_description, 
          :contact_email, 
          :contact_phone, 
          :menu_link, 
          :offers_delivery, 
          :offers_catering, 
          :vegetarian_options, 
          :vegan_options, 
          :halal_options, 
          :gluten_free_options, 
          :handles_tax_exemption, 
          :handles_small_cater_size, 
          :handles_medium_cater_size, 
          :handles_large_cater_size, 
          :handles_xlarge_cater_size, 
          :small_cater_size_lead_time, 
          :medium_cater_size_lead_time, 
          :large_cater_size_lead_time, 
          :xlarge_cater_size_lead_time, 
          :cater_pick_up, 
          :cater_drop_off, 
          :cater_setup, 
          :cater_full_service, 
          :is_published, 
          :is_food_truck, 
          :is_on_campus, 
          :is_phdc, 
          :featured_image, 
          :bio, 
          gallery: []
        )
    end

    def authorize_model
      authorize! :manage, Business
    end
end
