module LandingHelper

  LANDING_INSTAGRAM_HANDLE = "@centerforsharedprosperity"

  # Links in the main navigation bar (same pages as layouts/_header_front).
  def landing_nav_links
    [
      { label: "About Us", path: about_us_path },
      { label: "Join GoLocal", path: about_join_golocal_path },
      { label: "Catering Tips", path: about_catering_tips_path },
      { label: "Our Partners", path: about_our_partners_path },
      { label: "News", path: about_news_index_path },
      { label: "Testimonials", path: about_testimonials_path },
    ]
  end

  def landing_instagram_url
    "https://instagram.com/#{LANDING_INSTAGRAM_HANDLE.delete('@')}"
  end

  def landing_icon(name, css_class: "landing-icon", alt: "")
    image_tag("landing/icons/#{name}.png", class: css_class, alt: alt)
  end

  # Photo for a business card: featured image, then logo, then nothing.
  def landing_business_image_url(business)
    if business.featured_image.attached?
      url_for(business.featured_image)
    elsif business.logo.attached?
      url_for(business.logo)
    end
  end

  # [label, icon, pill css class] for each dietary option a business offers.
  def landing_dietary_badges(business)
    [
      [business.vegan_options, "Vegan", "vegan", "landing-pill-veg"],
      [business.vegetarian_options, "Vegetarian", "vegetarian", "landing-pill-veg"],
      [business.gluten_free_options, "Gluten-Free", "gluten-free", "landing-pill-diet"],
      [business.halal_options, "Halal", "halal", "landing-pill-diet"],
    ].select(&:first).map { |_, label, icon, css| [label, icon, css] }
  end

  # Inline SVG for the few icons the demo takes from lucide-react.
  def landing_svg_icon(name, size: 20)
    paths = {
      instagram: '<rect width="20" height="20" x="2" y="2" rx="5" ry="5"/><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"/><line x1="17.5" x2="17.51" y1="6.5" y2="6.5"/>',
      menu: '<line x1="4" x2="20" y1="12" y2="12"/><line x1="4" x2="20" y1="6" y2="6"/><line x1="4" x2="20" y1="18" y2="18"/>',
      heart: '<path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/>',
      chevron_left: '<path d="m15 18-6-6 6-6"/>',
      chevron_right: '<path d="m9 18 6-6-6-6"/>',
      x: '<path d="M18 6 6 18"/><path d="m6 6 12 12"/>',
    }
    fill = name == :heart ? "currentColor" : "none"
    %(<svg xmlns="http://www.w3.org/2000/svg" width="#{size}" height="#{size}" viewBox="0 0 24 24" fill="#{fill}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">#{paths.fetch(name)}</svg>).html_safe
  end

end
