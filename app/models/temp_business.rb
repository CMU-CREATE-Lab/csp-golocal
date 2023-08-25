class TempBusiness < ApplicationRecord
  has_one_attached :logo
  has_many_attached :gallery
end
