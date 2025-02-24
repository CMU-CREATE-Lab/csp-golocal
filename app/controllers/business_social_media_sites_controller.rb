class BusinessSocialMediaSitesController < ApplicationController

  layout "application_back"

  before_action :check_authorization
  before_action :set_business_social_media_site, only: %i[ edit update destroy ]

  # access to business model when in route with nested resources (e.g.  business_keywords_path => "/businesses/:business_id/keywords")
  before_action :set_business

  def index
    @business_social_media_sites = @business ? @business.business_social_media_sites : BusinessSocialMediaSite.all
  end

  def new
    @business_social_media_site = BusinessSocialMediaSite.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @business_social_media_site.update(business_social_media_site_params)
        format.html { redirect_to (@business ? business_business_social_media_sites_path(@business) : business_business_social_media_sites_path), notice: "Business Social Media Site was successfully updated." }
        format.json { render :index, status: :ok, location: @business_social_media_site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business_social_media_site.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @business_social_media_site = BusinessSocialMediaSite.new(business_social_media_site_params)
    #@keyword = Keyword.new(keyword_params)

    respond_to do |format|
      if @business_social_media_site.save
        format.html { redirect_to (@business ? business_business_social_media_sites_path(@business) : @business_social_media_site), notice: "Keyword was successfully created." }
        format.json { render :index, status: :created, location: @business_social_media_site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business_social_media_site.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business_social_media_site.destroy

    respond_to do |format|
      format.html { redirect_to business_business_social_media_sites_path(@business), notice: "Business Social Media Site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def check_authorization
      authorize! :manage, BusinessSocialMediaSite
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_business_social_media_site
      @business_social_media_site = BusinessSocialMediaSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_social_media_site_params
      params.require(:business_social_media_site).permit(:url, :business_id, :social_media_site_id)
    end

    def set_business
      @business = Business.find(params[:business_id]) if params[:business_id]
    end
end
