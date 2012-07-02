require "open-uri"

class Item < ActiveRecord::Base
  attr_accessible :description, :url, :photo_url, :location, :wedding_id, :image_file_name
  belongs_to :wedding

  validates :wedding, presence: true
  validates :photo_url, presence: true

  has_attached_file :image,
                    storage:        :s3,
                    bucket:         'bride-items',
                    s3_credentials: S3_CREDENTIALS

  def image_from_url(url)
    begin
      io = open(URI.parse(url))
      def io.original_filename
        base_uri.path.split("/").last
      end
      self.image = io.original_filename.blank? ? nil : io
      self.save
      reset_photo_url
    rescue
      self.image = nil
    rescue OpenURI::Error => e
      self.image = nil
    end
  end

  def reset_photo_url
    self.photo_url = self.image.url
    self.save
  end
end

