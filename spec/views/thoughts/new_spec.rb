require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/thoughts/new.html.erb" do
  include ThoughtsHelper
  
  before(:each) do
    @thought = mock_model(Thought)
    @thought.stub!(:new_record?).and_return(true)
    @thought.stub!(:title).and_return("MyString")
    @thought.stub!(:description).and_return("MyString")
    @thought.stub!(:user_id).and_return("1")
    assigns[:thought] = @thought


    template.stub!(:object_url).and_return(thought_path(@thought)) 
    template.stub!(:collection_url).and_return(thoughts_path) 
  end

  it "should render new form" do
    render "/thoughts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", thoughts_path) do
      with_tag("input#thought_title[name=?]", "thought[title]")
      with_tag("input#thought_description[name=?]", "thought[description]")
    end
  end
end


