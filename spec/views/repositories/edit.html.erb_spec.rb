require 'spec_helper'

describe "repositories/edit" do
  before(:each) do
    @repository = assign(:repository, stub_model(Repository,
      :name => "MyString",
      :city => "MyString",
      :country => "MyString",
      :address => "MyString",
      :postal => "MyString",
      :website => "MyString",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit repository form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => repositories_path(@repository), :method => "post" do
      assert_select "input#repository_name", :name => "repository[name]"
      assert_select "input#repository_city", :name => "repository[city]"
      assert_select "input#repository_country", :name => "repository[country]"
      assert_select "input#repository_address", :name => "repository[address]"
      assert_select "input#repository_postal", :name => "repository[postal]"
      assert_select "input#repository_website", :name => "repository[website]"
      assert_select "input#repository_phone", :name => "repository[phone]"
      assert_select "input#repository_email", :name => "repository[email]"
    end
  end
end
