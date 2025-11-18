class ManagedFile < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true, uniqueness: true
  validates :file, presence: true, size: { less_than: 200.megabytes }

  def streamed_filename_path
    #"/managed_files/stream/#{CGI.escape(self.name)}"
    "/managed_files/stream/#{URI::DEFAULT_PARSER.escape(self.name)}"
  end

end
