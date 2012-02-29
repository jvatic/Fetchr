class Url < ActiveRecord::Base
  has_many :links, :as => :resourceful
  has_many :images, :as => :resourceful
end
