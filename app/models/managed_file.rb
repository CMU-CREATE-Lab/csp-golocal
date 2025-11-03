class ManagedFile < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true, uniqueness: true
  validates :file, presence: true, size: { less_than: 200.megabytes }

end
