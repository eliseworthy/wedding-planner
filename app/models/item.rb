class Item < ActiveRecord::Base
  attr_accessible :description, :url, :photo_url, :location, :wedding_id
  belongs_to :wedding

  validates :wedding, presence: true
  validates :description, :photo_url, presence: true
end
