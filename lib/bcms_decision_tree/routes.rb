module Cms::Routes
  def routes_for_bcms_decision_tree
    resources :nodes
    namespace(:cms) do 
      content_blocks :nodes
      #content_blocks :bcms_decision_trees
    end
  end
end