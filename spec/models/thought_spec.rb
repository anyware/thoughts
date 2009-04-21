#/spec/models/thought_spec.rb
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Thought do
  before(:each) do
    @thought = Factory.build(:valid_thought)
  end

  it "should be valid" do
    @thought.should be_valid
    @thought.save!
  end
  
  it "should be invalid" do
    Factory.build(:invalid_thought).should be_invalid
  end
end
