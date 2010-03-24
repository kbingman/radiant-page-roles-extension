module PageRoles::PageExtensions
  
  def self.included(base)
    base.class_eval do
      before_save :check_role_compatibility
    end
  end
  
  def required_role
    if self.role.blank?
      role = !self.parent_id.nil? && self.parent.required_role  ? self.parent.required_role : 'all' 
    else
      self.role
    end
  end
  
  private
  
    # Prevents a page from having a "lower" role than its parent. This would just cause confusion.
    def check_role_compatibility
      self.children.each do |child|
        if self.required_role == 'admin' && child.role == 'designer'
          child.role = '' 
          child.save
        end
      end
    end
  
end
