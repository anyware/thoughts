require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Thought do
  before(:each) do
    @thought = Thought.new
  end

  it "should be valid" do
    @thought.should be_valid
  end
end
