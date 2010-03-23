module PageRoles::PagesControllerExtensions
  
  def self.included(base)
    base.class_eval do
      def edit
        verify_user_role(@page)
      end
    end
  end
  
  private
    
    def verify_user_role(page)
      allowed = case 
        when page.required_role == 'admin' && current_user.admin? : true
        when page.required_role == 'designer' && (current_user.admin? || current_user.designer?) : true
        when page.required_role == 'all' : true
      else
        false
      end
      allowed ? true : redirect_to(admin_pages_path)
    end
  
end