class Page < ActiveRecord::Base
  has_many :links
  has_many :images

  validates :url, :presence => true

  def base_url
    url.match(/^(https?:\/\/[^\/]+)/)[1]
  end
end
