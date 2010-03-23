module PageRoles::PageExtensions
  
  # def self.included(base)
  #   base.class_eval do
  # 
  #   end
  # end
  
  def required_role
    if self.role.blank?
      role = !self.parent_id.nil? && !self.parent.role.blank?  ? self.parent.role : 'all' 
    else
      self.role
    end
  end
  
  
end
