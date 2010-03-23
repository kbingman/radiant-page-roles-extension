# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class PageRolesExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/page_roles"
  
  # extension_config do |config|
  #   config.gem 'some-awesome-gem
  #   config.after_initialize do
  #     run_something
  #   end
  # end

  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :page_roles
  #   end
  # end
  
  def activate
    Page.send :include, PageRoles::PageExtensions
    ApplicationHelper.send :include, PageRolesHelper
    Admin::PagesController.send :include, PageRoles::PagesControllerExtensions 
    
    # admin.pages.edit.add :layout_row, "admin/pages/page_roles"
    admin.page.index.add :sitemap_head, 'admin/pages/roles_th', :after => 'status_column_header'
    admin.page.index.add :node, 'admin/pages/roles_td', :after => 'status_column'
    
    add_tab 'Settings' do
      add_item 'Page Roles', '/admin/page_roles'
    end
  end
  
end
