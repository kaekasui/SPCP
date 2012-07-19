require 'spec_helper'

describe "repositories/show" do
  before(:each) do
    @repository = assign(:repository, stub_model(Repository,
      :name => "Name",
      :city => "City",
      :country => "Country",
      :address => "Address",
      :postal => "Postal",
      :website => "Website",
      :phone => "Phone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/City/)
    rendered.should match(/Country/)
    rendered.should match(/Address/)
    rendered.should match(/Postal/)
    rendered.should match(/Website/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
  end
end
