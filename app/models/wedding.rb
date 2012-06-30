class Wedding < ActiveRecord::Base
  attr_accessible :description, :name, :user_id

  has_many :items

  validates :description, presence: true, length: { maximum: 256 }
  validates :name, presence: true
  validates :user_id, presence: true

  def photo_url
    self.items.first ? self.items.first.photo_url : "https://s3.amazonaws.com/bride-items/wedding.jpeg"
  end
end
