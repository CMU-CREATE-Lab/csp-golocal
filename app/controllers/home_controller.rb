class HomeController < ApplicationController

  layout "application_front"

  ROW_SIZE = 6

  # GoLocal landing page (ported from the Figma demo site)
  def index
    published = Business.where(is_published: true).includes(:cuisines)
    @business_count = published.count

    # No likes in the database yet, so "favorites" is a rotating random pick.
    @community_favorites = published.order(Arel.sql("RANDOM()")).limit(ROW_SIZE)

    render layout: "landing"
  end

  # moved "/about" pages to new controller
  def about_events
  end

end
