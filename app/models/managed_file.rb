class ManagedFile < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true, uniqueness: true
  validates :file, presence: true
end
