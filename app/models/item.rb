class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :wedding_id, :category_id
  belongs_to :wedding
  belongs_to :category

  validates :wedding, :category, presence: true
  validates :name, :description, presence: true, length: { maximum: 256 }

end
