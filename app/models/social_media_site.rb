class SocialMediaSite < ApplicationRecord
    has_one_attached :logo
    has_and_belongs_to_many :businesses, join_table: :business_social_media_site

    validates :name, presence: true
end
