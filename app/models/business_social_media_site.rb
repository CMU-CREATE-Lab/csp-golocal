class BusinessSocialMediaSite < ApplicationRecord
  belongs_to :business
  belongs_to :social_media_site

  validates :url, format: { with: /\A(http|https):\/\/[^\s\/$.?#].[^\s]*\z/, message: "must be a valid URL" }
end
