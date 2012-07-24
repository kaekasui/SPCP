require 'spec_helper'

describe "starts/index" do
  before(:each) do
    assign(:starts, [
      stub_model(Start),
      stub_model(Start)
    ])
  end

  it "renders a list of starts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
