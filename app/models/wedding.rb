class Wedding < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :photo_url

  has_many :items

  validates :description, presence: true, length: { maximum: 256 }
  validates :name, presence: true
  validates :user_id, presence: true

  def set_photo_url
    self.photo_url = self.items.first ? self.items.first.photo_url : "https://s3.amazonaws.com/bride-items/wedding.jpeg"
    self.save
  end
end
