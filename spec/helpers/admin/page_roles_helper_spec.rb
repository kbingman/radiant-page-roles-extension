# require File.dirname(__FILE__) + "/../../spec_helper"
# 
# describe Admin::PageRoles do
# 
#   before :each do
#     @page = mock_model(Page, :role => 'admin')
#     @user = mock_model(User, :is_admin = true)
#   end
# 
#   it "should render a sitemap node" do
#     helper.should_receive(:render).with(:partial => "node", :locals => {:level => 0, :simple => false, :page => @page}).and_return(@current_node)
#     helper.render_node(@page)
#     helper.assigns[:current_node] == @page
#   end
#   
# end