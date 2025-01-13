class BusinessSocialMediaSite < ApplicationRecord
  belongs_to :business
  belongs_to :social_media_site

  # TODO validates URL?
end
