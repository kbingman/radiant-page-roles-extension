module PageRoles::ApplicationHelperExtensions
  
  def self.included(base)
    base.module_eval do
      
      def verify_roles(role)
        case 
          when role == 'admin' && admin? : true
          when role == 'designer' && (admin? || designer?) : true
          when role == 'all' : true
        else
          false
        end
      end
      
      def available_roles(page)
        role = page.parent ? page.parent.required_role : ''
        case 
          # Prevents a page from having a "lower" role than its parent. This would just cause confusion.
          when role == 'admin' && admin? : [[t('select.inherit'), ''], [t('admin'),'admin']]
          when designer? && !admin? : [[t('select.inherit'), ''], [t('designer'),'designer']]
          when admin? : [[t('select.inherit'), ''], [t('designer'),'designer'], [t('admin'),'admin']]
        else
          [[t('select.inherit'), '']]
        end
      end
      
    end
  end
  
end