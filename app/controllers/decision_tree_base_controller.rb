class DecisionTreeBaseController < Cms::ApplicationController
  
  # needed to allow view helpers to work properly (e.g. cms_toolbar)
    # comment out this line if you don't  
    include Cms::TemplateSupport

    # needed to get the menus to render for non-cms namespaced controllers
    before_filter :get_home_page

    layout 'templates/default'

    private

    def get_home_page
     @page = Page.find_live_by_path("/") 
    end
end
