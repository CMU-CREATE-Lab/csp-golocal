json.extract! social_media_site, :id, :name, :logo, :created_at, :updated_at
json.url social_media_site_url(social_media_site, format: :json)
json.logo url_for(social_media_site.logo)
