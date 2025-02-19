class SocialMediaSitesController < ApplicationController

  before_action :check_authorization
  before_action :set_social_media_site, only: %i[ show edit update destroy ]

  # GET /social_media_sites or /social_media_sites.json
  def index
    @social_media_sites = SocialMediaSite.all
  end

  # GET /social_media_sites/1 or /social_media_sites/1.json
  def show
  end

  # GET /social_media_sites/new
  def new
    @social_media_site = SocialMediaSite.new
  end

  # GET /social_media_sites/1/edit
  def edit
  end

  # POST /social_media_sites or /social_media_sites.json
  def create
    @social_media_site = SocialMediaSite.new(social_media_site_params)

    respond_to do |format|
      if @social_media_site.save
        format.html { redirect_to social_media_site_url(@social_media_site), notice: "Social media site was successfully created." }
        format.json { render :show, status: :created, location: @social_media_site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @social_media_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_media_sites/1 or /social_media_sites/1.json
  def update
    respond_to do |format|
      if @social_media_site.update(social_media_site_params)
        format.html { redirect_to social_media_site_url(@social_media_site), notice: "Social media site was successfully updated." }
        format.json { render :show, status: :ok, location: @social_media_site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @social_media_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_media_sites/1 or /social_media_sites/1.json
  def destroy
    @social_media_site.destroy

    respond_to do |format|
      format.html { redirect_to social_media_sites_url, notice: "Social media site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def check_authorization
      authorize! :manage, SocialMediaSite
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_social_media_site
      @social_media_site = SocialMediaSite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_media_site_params
      params.require(:social_media_site).permit(:name, :logo)
    end
end
