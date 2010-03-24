require File.dirname(__FILE__) + "/../spec_helper"

describe ApplicationHelper do
  dataset :users

  before :each do
    Radiant::Initializer.run :initialize_default_admin_tabs
    helper.stub!(:request).and_return(ActionController::TestRequest.new)
  end
  
  it "should return true if a user is an admin" do
    helper.stub!(:admin?).and_return(true)
    helper.stub!(:designer?).and_return(false)
    helper.verify_roles('admin').should == true
  end
  
  it "should return true if a user is a designer" do
    helper.stub!(:admin?).and_return(false)
    helper.stub!(:designer?).and_return(true)
    helper.verify_roles('designer').should == true
  end
  
  it "should return false if a user is not an admin" do
    helper.stub!(:admin?).and_return(false)
    helper.stub!(:designer?).and_return(false)
    helper.verify_roles('admin').should == false
  end
  
  it "should return false if a user is not a designer" do
    helper.stub!(:admin?).and_return(false)
    helper.stub!(:designer?).and_return(false)
    helper.verify_roles('designer').should == false
  end
  
  describe 'list of available roles' do
    
    before :each do
      @parent = mock_model(Page, :role => '', :required_role => 'all')
      @page = mock_model(Page, :role => '', :required_role => 'all', :parent => @parent)
    end
  
    it "should create a list of available roles for designers" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(true)
      helper.available_roles(@page).should == [[t('select.inherit'), ''], [t('designer'),'designer']]
    end
    
    it "should create a list of available roles for admins" do
      helper.stub!(:admin?).and_return(true)
      helper.stub!(:designer?).and_return(true)
      helper.available_roles(@page).should == [[t('select.inherit'), ''], [t('designer'),'designer'], [t('admin'),'admin']]
    end
    
    it "should create a list of available roles for admins when the parent role is admin" do
      @parent = mock_model(Page, :role => 'admin', :required_role => 'admin')
      @page = mock_model(Page, :role => '', :required_role => 'admin', :parent => @parent)
      helper.stub!(:admin?).and_return(true)
      helper.stub!(:designer?).and_return(true)
      helper.available_roles(@page).should == [[t('select.inherit'), ''], [t('admin'),'admin']]
    end
    
  end
  
end