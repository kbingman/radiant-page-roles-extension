require File.dirname(__FILE__) + "/../../spec_helper"

describe Admin::NodeHelper do
  before :each do
    @controller = mock("controller")
    @cookies = {}
    helper.stub!(:cookies).and_return(@cookies)
    helper.stub!(:homepage).and_return(nil)
  end
  
  describe 'page with Admin role assigned' do
    
    before :each do
      @page = mock_model(Page, :role => 'admin', :required_role => 'admin')
    end
    
    it "should render a sitemap node visible to admin for admins" do
      helper.stub!(:admin?).and_return(true)
      helper.stub!(:designer?).and_return(false)
      helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
    it "should not render a sitemap node visible to admin for designers" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(true)
      helper.should_not_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
    it "should not render a sitemap node visible to admin for normal users" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(false)
      helper.should_not_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
  end
  describe 'page with Designer role assigned' do
    
    before :each do
      @page = mock_model(Page, :role => 'designer', :required_role => 'designer')
    end
    
    it "should render a sitemap node visible to designers for admins" do
      helper.stub!(:admin?).and_return(true)
      helper.stub!(:designer?).and_return(false)
      helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
    it "should render a sitemap node visible to designers for designers" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(true)
      helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
    it "should not render a sitemap node visible to designers for normal users" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(false)
      helper.should_not_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
  end
  
  describe 'page with no role assigned' do
    
    before :each do
      @page = mock_model(Page, :role => '', :required_role => 'all')
    end
    
    it "should render a sitemap node visible to all for admins" do
      helper.stub!(:admin?).and_return(true)
      helper.stub!(:designer?).and_return(false)
      helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
    it "should render a sitemap node visible to all for designers" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(true)
      helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
    it "should not render a sitemap node visible to all for normal users" do
      helper.stub!(:admin?).and_return(false)
      helper.stub!(:designer?).and_return(false)
      helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
      helper.render_node(@page)
      helper.assigns[:current_node] = @page
    end
    
  end
end