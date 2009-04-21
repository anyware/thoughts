require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/thoughts/show.html.erb" do
  include ThoughtsHelper
  
  before(:each) do
    @thought = mock_model(Thought)
    @thought.stub!(:title).and_return("MyString")
    @thought.stub!(:description).and_return("MyString")
    @thought.stub!(:user_id).and_return("1")

    assigns[:thought] = @thought

    template.stub!(:edit_object_url).and_return(edit_thought_path(@thought)) 
    template.stub!(:collection_url).and_return(thoughts_path) 
  end

  it "should render attributes in <p>" do
    render "/thoughts/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

