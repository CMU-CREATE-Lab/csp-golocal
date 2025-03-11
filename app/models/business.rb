class Business < ApplicationRecord
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :cuisines

  has_one_attached :logo
  has_one_attached :featured_image
  has_many_attached :gallery
  has_many :business_social_media_sites, join_table: :business_social_media_site

  validates :logo, content_type: ['image/png', 'image/jpeg'], size: { less_than: 5.megabytes }
  validates :featured_image, content_type: ['image/png', 'image/jpeg'], size: { less_than: 5.megabytes }
  validates :gallery, content_type: ['image/png', 'image/jpeg'], size: { less_than: 5.megabytes }

  @@filter_keywords_to_display = {
    offers_delivery: "Delivery",
    offers_catering: "Catering",
    vegetarian_options: "Vegetarian",
    vegan_options: "Vegan",
    gluten_free_options: "Gluten-Free",
    halal_options: "Halal",
    cater_pickup: "Pick-Up",
    cater_dropoff: "Drop-Off",
    cater_setup: "Setup",
    cater_fullservice: "Full Service",
    cater_small: "Small (1-25)",
    cater_medium: "Medium (26-50)",
    cater_large: "Large (51-100)",
    cater_xlarge: "X-Large (100+)",
    tax_exempt: "Tax Exempt",
  }


  def self.filter_keywords
    return @@filter_keywords_to_display.keys.map(&:to_s)
  end


  def self.keywords_dietary_restrictions
    return [
      "vegetarian_options",
      "vegan_options",
      "gluten_free_options",
      "halal_options",
    ]
  end


  def self.keywords_catering_options
    return [
      "cater_pickup",
      "cater_dropoff",
      "cater_setup",
      "cater_fullservice",
    ]
  end


  def self.keywords_event_sizes
    return [
      "cater_small",
      "cater_medium",
      "cater_large",
      "cater_xlarge",
    ]
  end


  def self.filter_keywords_to_display
    return @@filter_keywords_to_display
  end


  def generate_keywords
    result = []
    result.push("offers_delivery") if self.offers_delivery
    result.push("offers_catering") if self.offers_catering
    result.push("vegetarian_options") if self.vegetarian_options
    result.push("vegan_options") if self.vegan_options
    result.push("gluten_free_options") if self.gluten_free_options
    result.push("halal_options") if self.halal_options
    result.push("cater_pickup") if self.cater_pick_up
    result.push("cater_dropoff") if self.cater_drop_off
    result.push("cater_setup") if self.cater_setup
    result.push("cater_fullservice") if self.cater_full_service
    result.push("cater_small") if self.handles_small_cater_size
    result.push("cater_medium") if self.handles_medium_cater_size
    result.push("cater_large") if self.handles_large_cater_size
    result.push("cater_xlarge") if self.handles_xlarge_cater_size
    result.push("tax_exempt") if self.handles_tax_exemption
    # TODO other keywords? (from keywords table?)
    return result
  end


  def generate_keywords_for_filter
    return (Business.filter_keywords & generate_keywords())
  end


  def generate_span_text_for_dietary_restrictions
    result = Business.keywords_dietary_restrictions() & generate_keywords()
    return result.map{|x| @@filter_keywords_to_display[x.to_sym] }.join ", "
  end


  def generate_span_text_for_catering_options
    result = Business.keywords_catering_options() & generate_keywords()
    return result.map{|x| @@filter_keywords_to_display[x.to_sym] }.join ", "
  end


  def generate_span_text_for_event_sizes
    result = Business.keywords_event_sizes() & generate_keywords()
    return result.map{|x| @@filter_keywords_to_display[x.to_sym] }.join ", "
  end

end
