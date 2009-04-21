require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ThoughtsController do
  describe "handling GET /thoughts" do

    before(:each) do
      @thought = mock_model(Thought)
      Thought.stub!(:find).and_return([@thought])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all thoughts" do
      Thought.should_receive(:find).with(:all).and_return([@thought])
      do_get
    end
  
    it "should assign the found thoughts for the view" do
      do_get
      assigns[:thoughts].should == [@thought]
    end
  end

  describe "handling GET /thoughts/1" do

    before(:each) do
      @thought = mock_model(Thought)
      Thought.stub!(:find).and_return(@thought)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the thought requested" do
      Thought.should_receive(:find).with("1").and_return(@thought)
      do_get
    end
  
    it "should assign the found thought for the view" do
      do_get
      assigns[:thought].should equal(@thought)
    end
  end

  describe "handling GET /thoughts/new" do

    before(:each) do
      @thought = mock_model(Thought)
      Thought.stub!(:new).and_return(@thought)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new thought" do
      Thought.should_receive(:new).and_return(@thought)
      do_get
    end
  
    it "should not save the new thought" do
      @thought.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new thought for the view" do
      do_get
      assigns[:thought].should equal(@thought)
    end
  end

  describe "handling GET /thoughts/1/edit" do

    before(:each) do
      @thought = mock_model(Thought)
      Thought.stub!(:find).and_return(@thought)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the thought requested" do
      Thought.should_receive(:find).and_return(@thought)
      do_get
    end
  
    it "should assign the found Thoughts for the view" do
      do_get
      assigns[:thought].should equal(@thought)
    end
  end

  describe "handling POST /thoughts" do

    before(:each) do
      @thought = mock_model(Thought, :to_param => "1")
      Thought.stub!(:new).and_return(@thought)
    end
    
    describe "with successful save" do
  
      def do_post
        @thought.should_receive(:save).and_return(true)
        post :create, :thought => {}
      end
  
      it "should create a new thought" do
        Thought.should_receive(:new).with({}).and_return(@thought)
        do_post
      end

      it "should redirect to the new thought" do
        do_post
        response.should redirect_to(thought_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @thought.should_receive(:save).and_return(false)
        post :create, :thought => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /thoughts/1" do

    before(:each) do
      @thought = mock_model(Thought, :to_param => "1")
      Thought.stub!(:find).and_return(@thought)
    end
    
    describe "with successful update" do

      def do_put
        @thought.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the thought requested" do
        Thought.should_receive(:find).with("1").and_return(@thought)
        do_put
      end

      it "should update the found thought" do
        do_put
        assigns(:thought).should equal(@thought)
      end

      it "should assign the found thought for the view" do
        do_put
        assigns(:thought).should equal(@thought)
      end

      it "should redirect to the thought" do
        do_put
        response.should redirect_to(thought_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @thought.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /thoughts/1" do

    before(:each) do
      @thought = mock_model(Thought, :destroy => true)
      Thought.stub!(:find).and_return(@thought)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the thought requested" do
      Thought.should_receive(:find).with("1").and_return(@thought)
      do_delete
    end
  
    it "should call destroy on the found thought" do
      @thought.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the thoughts list" do
      do_delete
      response.should redirect_to(thoughts_url)
    end
  end
end
