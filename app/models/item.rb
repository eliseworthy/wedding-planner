class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :type, :wedding_id
  belongs_to :wedding

  validates :wedding_id, presence: true
  validates :name, :description, presence: true, length: { maximum: 256 }

end
