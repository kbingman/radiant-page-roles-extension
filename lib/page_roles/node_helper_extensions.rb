module PageRoles::NodeHelperExtensions
  include PageRoles::ApplicationHelperExtensions
  
  def self.included(base)
    base.module_eval do
            
      def render_node(page, locals = {})
        @current_node = page
        if verify_roles(page.required_role)
          locals.reverse_merge!(:level => 0, :simple => false).merge!(:page => page)
          render :partial => 'node', :locals =>  locals
        end
      end
      
    end
  end
  
end