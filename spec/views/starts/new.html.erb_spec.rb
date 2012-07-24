require 'spec_helper'

describe "starts/new" do
  before(:each) do
    assign(:start, stub_model(Start).as_new_record)
  end

  it "renders new start form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => starts_path, :method => "post" do
    end
  end
end
