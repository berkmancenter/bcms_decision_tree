class DecisionTreePortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
     
  def render
    @start_nodes = Node.all(:conditions => {:first => true})
    @nodes = Node.all(:order => "name", :limit => self.limit)
  end
    
end