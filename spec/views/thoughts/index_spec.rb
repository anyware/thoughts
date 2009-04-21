require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/thoughts/index.html.erb" do
  include ThoughtsHelper
  
  before(:each) do
    thought_98 = mock_model(Thought)
    thought_98.should_receive(:title).and_return("MyString")
    thought_98.should_receive(:description).and_return("MyString")
    thought_98.should_receive(:user_id).and_return("1")
    thought_99 = mock_model(Thought)
    thought_99.should_receive(:title).and_return("MyString")
    thought_99.should_receive(:description).and_return("MyString")
    thought_99.should_receive(:user_id).and_return("1")

    assigns[:thoughts] = [thought_98, thought_99]

    template.stub!(:object_url).and_return(thought_path(thought_99))
    template.stub!(:new_object_url).and_return(new_thought_path) 
    template.stub!(:edit_object_url).and_return(edit_thought_path(thought_99))
  end

  it "should render list of thoughts" do
    render "/thoughts/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

