require 'spec_helper'

describe "urls/show" do
  before(:each) do
    @url = assign(:url, stub_model(Url,
      :url => "Url",
      :title => "Title",
      :body => "MyText",
      :fetch_error => "Fetch Error"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fetch Error/)
  end
end
