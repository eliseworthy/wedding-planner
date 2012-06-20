class Wedding < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  has_many :items

  validates :description, presence: true, length: { maximum: 256 }
  validates :name, presence: true
  validates :user_id, presence: true
end
