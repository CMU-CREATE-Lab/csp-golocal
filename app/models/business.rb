class Business < ApplicationRecord
  has_and_belongs_to_many :keywords

  has_one_attached :logo
  has_many_attached :gallery

  validates :logo, content_type: ['image/png', 'image/jpeg'], size: { less_than: 5.megabytes }
  validates :gallery, content_type: ['image/png', 'image/jpeg'], size: { less_than: 5.megabytes }

  @@filter_keywords_to_display = {
    offers_delivery: "Delivery",
    offers_catering: "Catering",
    vegetarian_options: "Vegetarian",
    vegan_options: "Vegan",
    gluten_free_options: "Gluten-Free",
    cater_dropoff: "Cater: Drop-Off",
    cater_setup: "Cater: Setup",
    cater_fullservice: "Cater: Full Service",
    cater_small: "Cater: Small (1-25)",
    cater_medium: "Cater: Medium (26-50)",
    cater_large: "Cater: Large (51-100)",
    cater_xlarge: "Cater: X-Large (100+)",
  }


  def self.filter_keywords
    return @@filter_keywords_to_display.keys.map(&:to_s)
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
    result.push("cater_dropoff") if self.cater_drop_off
    result.push("cater_setup") if self.cater_setup
    result.push("cater_fullservice") if self.cater_full_service
    result.push("cater_small") if self.handles_small_cater_size
    result.push("cater_medium") if self.handles_medium_cater_size
    result.push("cater_large") if self.handles_large_cater_size
    result.push("cater_xlarge") if self.handles_xlarge_cater_size
    # TODO other keywords? (from keywords table?)
    # TODO other keywords? -- handles_tax_exemption
    return result
  end


  def generate_keywords_for_filter
    return (Business.filter_keywords & generate_keywords())
  end

end
