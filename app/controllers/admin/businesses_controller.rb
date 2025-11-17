class Admin::BusinessesController < ApplicationController

  layout "application_back"

  def index
    authorize! :manage, Business
    @businesses_published = Business.where(:is_published => true).order('LOWER(name) ASC')
    @businesses_unpublished = Business.where(:is_published => false).order('LOWER(name) ASC')
  end

  def social_media_sites
    render :inline => "Admin::BusinessesController.social_media_sites"
  end
  def keywords
    render :inline => "Admin::BusinessesController.keywords"
  end
  def cuisines
    render :inline => "Admin::BusinessesController.cuisines"
  end

end
