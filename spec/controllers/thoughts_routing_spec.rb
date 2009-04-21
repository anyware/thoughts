require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ThoughtsController do
  describe "route generation" do

    it "should map { :controller => 'thoughts', :action => 'index' } to /thoughts" do
      route_for(:controller => "thoughts", :action => "index").should == "/thoughts"
    end
  
    it "should map { :controller => 'thoughts', :action => 'new' } to /thoughts/new" do
      route_for(:controller => "thoughts", :action => "new").should == "/thoughts/new"
    end
  
    it "should map { :controller => 'thoughts', :action => 'show', :id => '1'} to /thoughts/1" do
      route_for(:controller => "thoughts", :action => "show", :id => "1").should == "/thoughts/1"
    end
  
    it "should map { :controller => 'thoughts', :action => 'edit', :id => '1' } to /thoughts/1/edit" do
      route_for(:controller => "thoughts", :action => "edit", :id => "1").should == "/thoughts/1/edit"
    end
  
    it "should map { :controller => 'thoughts', :action => 'update', :id => '1' } to /thoughts/1" do
      route_for(:controller => "thoughts", :action => "update", :id => "1").should == {:path => "/thoughts/1", :method => :put}
    end
  
    it "should map { :controller => 'thoughts', :action => 'destroy', :id => '1' } to /thoughts/1" do
      route_for(:controller => "thoughts", :action => "destroy", :id => "1").should == {:path => "/thoughts/1", :method => :delete}
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'thoughts', action => 'index' } from GET /thoughts" do
      params_from(:get, "/thoughts").should == {:controller => "thoughts", :action => "index"}
    end
  
    it "should generate params { :controller => 'thoughts', action => 'new' } from GET /thoughts/new" do
      params_from(:get, "/thoughts/new").should == {:controller => "thoughts", :action => "new"}
    end
  
    it "should generate params { :controller => 'thoughts', action => 'create' } from POST /thoughts" do
      params_from(:post, "/thoughts").should == {:controller => "thoughts", :action => "create"}
    end
  
    it "should generate params { :controller => 'thoughts', action => 'show', id => '1' } from GET /thoughts/1" do
      params_from(:get, "/thoughts/1").should == {:controller => "thoughts", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'thoughts', action => 'edit', id => '1' } from GET /thoughts/1;edit" do
      params_from(:get, "/thoughts/1/edit").should == {:controller => "thoughts", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'thoughts', action => 'update', id => '1' } from PUT /thoughts/1" do
      params_from(:put, "/thoughts/1").should == {:controller => "thoughts", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'thoughts', action => 'destroy', id => '1' } from DELETE /thoughts/1" do
      params_from(:delete, "/thoughts/1").should == {:controller => "thoughts", :action => "destroy", :id => "1"}
    end
  end
end
