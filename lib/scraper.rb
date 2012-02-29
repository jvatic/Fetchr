require 'nokogiri'
require 'open-uri'

module Scraper

  class << self
    def fetch(url)
      @page = Page.where(:url => url).first_or_create!
      doc = Nokogiri::HTML( open(@page.url) )
      Import.new(@page, doc)
    rescue SocketError => e
      @page.update_attribute(:fetch_error, e.message)
    ensure
      @page
    end
  end

  class Import

    def initialize(page, doc)
      @page = page
      @page.title = doc.title
      @page.body = doc.xpath("//body").text()
      @page.last_fetch_at = Time.now
      @page.save!

      parse(doc)
    end

    def parse(doc)
      images = doc.xpath("//img")
      images.each do |image|
        attributes = extract_attrs(image)
        @page.images.create(:url => attributes.delete(:src), :attrs => attributes)
      end

      links = doc.xpath("//a")
      links.each do |link|
        attributes = extract_attrs(link)
        @page.links.create(:url => attributes.delete(:href), :attrs => attributes)
      end
    end

    private

    def extract_attrs(element)
      element.attributes.inject({}) { |memo, (k,v)| memo[k.to_sym] = v.to_s; memo }
    end

  end

end
