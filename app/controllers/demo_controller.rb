class DemoController < ApplicationController

  # layout "application_front", except: %i[  ]

  # TODO generalize index of multiple demos (hardcoded for now)

  def demo0
    render :inline => "demo0"
  end


  def demo1
    @businesses = Business.where(:is_published => true)
    @filter_keywords_to_display = Business.filter_keywords_to_display
    @js_businesses = @businesses.map{|x| {name: x.name, headline_description: (x.headline_description.blank? ? "" : x.headline_description), logo: (x.logo.blank? ? "" : url_for(x.logo)), link: "/businesses/#{x.id}", keywords: x.generate_keywords_for_filter}}.to_json
    @js_filter_keywords_to_display = @filter_keywords_to_display.to_json
    render "demo1", layout: "application_front_demo1"
  end

end
