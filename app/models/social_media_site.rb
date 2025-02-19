class SocialMediaSite < ApplicationRecord
    has_one_attached :logo
    has_many :business_social_media_sites, join_table: :business_social_media_site

    validates :name, presence: true
end
