module PageRoles::PageExtensions
  
  def required_role
    if self.role.blank?
      role = !self.parent_id.nil? && !self.parent.role.blank?  ? self.parent.role : 'all' 
    else
      self.role
    end
  end
  
end
