module PageRolesHelper
  
  def self.included(base)
    base.module_eval do
      
      def verify_roles(role)
        case 
          when role == 'admin' && current_user.admin? : true
          when role == 'designer' && (current_user.admin? || current_user.designer?) : true
          when role == 'all' : true
        else
          false
        end
      end
      
      def available_roles(role)
        case 
          when role == 'admin' : [[t('select.inherit'), ''], [t('admin'),'admin']]
          when role == 'designer' : [[t('select.inherit'), ''], [t('designer'),'designer'], [t('admin'),'admin']]
        else
          [[t('select.inherit'), ''], [t('designer'),'designer'], [t('admin'),'admin']]
        end
      end
      
    end
  end
  
end