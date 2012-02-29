class Resource < ActiveRecord::Base
  belongs_to :page

  serialize :attrs, Hash

  before_save :expand_url

  def relative_url?
    url =~ /^https?/ ? false : true
  end

  private

  def expand_url
    if relative_url?
      self.url = page.base_url + url.sub(/^\/?/, '/')
    end
  end
end
