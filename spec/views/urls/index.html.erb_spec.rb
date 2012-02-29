require 'spec_helper'

describe "urls/index" do
  before(:each) do
    assign(:urls, [
      stub_model(Url,
        :url => "Url",
        :title => "Title",
        :body => "MyText",
        :fetch_error => "Fetch Error"
      ),
      stub_model(Url,
        :url => "Url",
        :title => "Title",
        :body => "MyText",
        :fetch_error => "Fetch Error"
      )
    ])
  end

  it "renders a list of urls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fetch Error".to_s, :count => 2
  end
end
