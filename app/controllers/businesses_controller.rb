class BusinessesController < ApplicationController

  layout "application_front", except: %i[ edit edit_gallery new ]
  ## note: for multiple layouts, define in call to render
  #layout "application_back", only: %i[ edit edit_gallery new ]

  before_action :set_business, only: %i[ show edit edit_gallery update destroy ]

  # GET /businesses or /businesses.json
  def index
    @businesses = Business.where(:is_published => true)
    @filter_keywords_to_display = Business.filter_keywords_to_display
    @js_businesses = @businesses.map{
      |x| {
        name: x.name,
        headline_description: (x.headline_description.blank? ? "" : x.headline_description),
        logo: (x.logo.blank? ? "" : url_for(x.logo)),
        link: "/businesses/#{x.id}",
        keywords: x.generate_keywords_for_filter,
        span_text_for_dietary_restrictions: x.generate_span_text_for_dietary_restrictions,
        span_text_for_catering_options: x.generate_span_text_for_catering_options,
        span_text_for_event_sizes: x.generate_span_text_for_event_sizes,
        featured_image: (x.featured_image.blank? ? "" : url_for(x.featured_image)),
        is_food_truck: x.is_food_truck,
        is_on_campus: x.is_on_campus,
        is_phdc: x.is_phdc,
      }
    }.to_json
    @js_filter_keywords_to_display = @filter_keywords_to_display.to_json
  end

  # GET /businesses/1 or /businesses/1.json
  def show
    @filter_keywords_to_display = Business.filter_keywords_to_display
    @header_buttons = [
      {
        :icon => "glyphicon-arrow-left",
        :link => businesses_path
      }
    ]
  end

  # GET /businesses/new
  def new
    authorize! :create, Business
    @business = Business.new
    @keywords = Keyword.all
    @cuisines = Cuisine.all

    render "new", layout: "application_back"
  end

  # GET /businesses/1/edit
  def edit
    authorize! :update, Business
    @keywords = Keyword.all
    @cuisines = Cuisine.all

    render "edit", layout: "application_back"
  end

  def edit_gallery
    authorize! :update, Business

    render "edit_gallery", layout: "application_back"
  end

  # POST /businesses or /businesses.json
  def create
    authorize! :create, Business
    @business = Business.new(business_params)
    respond_to do |format|
      if @business.save
        # overrides strong parameters
        keyword_params = request.parameters
        keywords_selected = keyword_params[:keywords_selected].nil? ? [] : keyword_params[:keywords_selected].map{|x,y| y == "1" ? (Keyword.exists?(x) ? Keyword.find(x) : nil) : nil} - [nil]
        @business.keywords = keywords_selected
        cuisines_selected = keyword_params[:cuisines_selected].nil? ? [] : keyword_params[:cuisines_selected].map{|x,y| y == "1" ? (Cuisine.exists?(x) ? Cuisine.find(x) : nil) : nil} - [nil]
        @business.cuisines = cuisines_selected
        format.html { redirect_to business_url(@business), notice: "Business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        @keywords = Keyword.all
        @cuisines = Cuisine.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    authorize! :update, Business
    respond_to do |format|
      if @business.update(business_params)
        # overrides strong parameters
        keyword_params = request.parameters
        keywords_selected = keyword_params[:keywords_selected].nil? ? [] : keyword_params[:keywords_selected].map{|x,y| y == "1" ? (Keyword.exists?(x) ? Keyword.find(x) : nil) : nil} - [nil]
        @business.keywords = keywords_selected
        cuisines_selected = keyword_params[:cuisines_selected].nil? ? [] : keyword_params[:cuisines_selected].map{|x,y| y == "1" ? (Cuisine.exists?(x) ? Cuisine.find(x) : nil) : nil} - [nil]
        @business.cuisines = cuisines_selected
        format.html { redirect_to business_url(@business), notice: "Business was successfully updated." }
        format.json { render :show, status: :ok, location: @business }
      else
        @keywords = Keyword.all
        @cuisines = Cuisine.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    authorize! :destroy, Business
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
      params.require(:business).permit(:name, :headline_description, :delivery_information, :logo, :business_hours, :catering_hours, :address, :website_link, :contact_name_description, :contact_email, :contact_phone, :menu_link, :offers_delivery, :offers_catering, :vegetarian_options, :vegan_options, :gluten_free_options, :handles_tax_exemption, :handles_small_cater_size, :handles_medium_cater_size, :handles_large_cater_size, :handles_xlarge_cater_size, :small_cater_size_lead_time, :medium_cater_size_lead_time, :large_cater_size_lead_time, :xlarge_cater_size_lead_time, :cater_pick_up, :cater_drop_off, :cater_setup, :cater_full_service, :is_published, :is_food_truck, :is_on_campus, :is_phdc, :featured_image, :bio, gallery: [])
    end
end
