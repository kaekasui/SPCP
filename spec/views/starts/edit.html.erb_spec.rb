require 'spec_helper'

describe "starts/edit" do
  before(:each) do
    @start = assign(:start, stub_model(Start))
  end

  it "renders the edit start form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => starts_path(@start), :method => "post" do
    end
  end
end
