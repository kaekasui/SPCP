require 'spec_helper'

describe "starts/show" do
  before(:each) do
    @start = assign(:start, stub_model(Start))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end