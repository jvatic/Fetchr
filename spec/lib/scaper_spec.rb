require 'spec_helper'

def sample_page_html
  File.read(
    File.open(
      File.join(Rails.root, 'spec', 'fixtures', 'sample_page.html')
    )
  )
end

describe Scraper do
  it "finds and saves images and links" do
    Scraper.stub(:open) { sample_page_html }
    Resource.delete_all

    lambda {
      Scraper.fetch("http://example.com")
    }.should change(Resource, :count).from(0).to(3)

    Image.first.url.should == "http://example.com/logo.png"
    Link.first.url.should == "http://example.com/dolor"
    Link.last.url.should == "http://example.co.uk"
  end
end

