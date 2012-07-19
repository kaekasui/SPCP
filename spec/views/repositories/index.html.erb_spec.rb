require 'spec_helper'

describe "repositories/index" do
  before(:each) do
    assign(:repositories, [
      stub_model(Repository,
        :name => "Name",
        :city => "City",
        :country => "Country",
        :address => "Address",
        :postal => "Postal",
        :website => "Website",
        :phone => "Phone",
        :email => "Email"
      ),
      stub_model(Repository,
        :name => "Name",
        :city => "City",
        :country => "Country",
        :address => "Address",
        :postal => "Postal",
        :website => "Website",
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of repositories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Postal".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
