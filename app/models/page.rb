class Page < ActiveRecord::Base
  has_many :links,  :as => :resourceful
  has_many :images, :as => :resourceful

  validates :url, :presence => true
end
