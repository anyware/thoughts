require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/thoughts/edit.html.erb" do
  include ThoughtsHelper
  
  before do
    @thought = mock_model(Thought)
    @thought.stub!(:title).and_return("MyString")
    @thought.stub!(:description).and_return("MyString")
    @thought.stub!(:user_id).and_return("1")
    assigns[:thought] = @thought

    template.should_receive(:object_url).twice.and_return(thought_path(@thought)) 
    template.should_receive(:collection_url).and_return(thoughts_path) 
  end

  it "should render edit form" do
    render "/thoughts/edit.html.erb"
    
    response.should have_tag("form[action=#{thought_path(@thought)}][method=post]") do
      with_tag('input#thought_title[name=?]', "thought[title]")
      with_tag('input#thought_description[name=?]', "thought[description]")
    end
  end
end


