class Admin::NewsPostsController < ApplicationController

  layout "application_back"

  def index
    authorize! :manage, NewsPost
    @news_posts = NewsPost.where(published: true).order(created_at: :desc)
    #render :inline => "Admin::NewsPostsController"
  end

end
