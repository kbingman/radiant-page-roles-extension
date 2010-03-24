require File.dirname(__FILE__) + '/../spec_helper'

describe Page, 'validations' do
  dataset :pages
  test_helper :validations

  before :each do
    @page = @model = Page.new(page_params)
  end
  
  it 'should show "all" if the page has no role assigned' do
    @page.parent = pages(:home)
    @page.required_role.should == 'all'
  end
  
  it 'should show the parents role if the page has no role assigned' do
    parent = @page.parent = pages(:home)
    parent.role = "administrator"
    @page.role = ''
    @page.required_role.should == 'administrator'
  end
  
  it 'should show its own role if the page has role assigned' do
    parent = @page.parent = pages(:home)
    parent.role = "designer"
    @page.role = 'administrator'
    @page.required_role.should == 'administrator'
  end
  
  it 'should show the grandparents role if the page and its parent has no role assigned' do
    grandparent = pages(:home)
    parent = Page.new(page_params)
    parent.parent = grandparent
    grandparent.role = 'designer'
    @page.parent = parent
    @page.role = ''
    @page.required_role.should == 'designer'
  end
  
end