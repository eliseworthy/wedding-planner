class Wedding < ActiveRecord::Base
  attr_accessible :description, :name, :photo, :user_id
end
