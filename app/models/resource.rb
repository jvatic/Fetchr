class Resource < ActiveRecord::Base
  belongs_to :resourceful, :polymorphic => true

  serialize :attrs, Hash

  before_save :expand_url

  def relative_url?
    @url =~ /^https?/ ? false : true
  end

  private

  def expand_url
    if relative_url?
      self.url = resourceful.base_url + url.sub(/^\/?/, '/')
    end
  end
end
