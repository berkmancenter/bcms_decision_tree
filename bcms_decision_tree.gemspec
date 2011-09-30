Gem::Specification.new do |spec|
  spec.name = "bcms_decision_tree"
  spec.rubyforge_project = spec.name
  spec.version = "1.0.0"
  spec.summary = "A Bcms Decision Tree Module for BrowserCMS"
  spec.author = "BrowserMedia" 
  spec.email = "github@browsermedia.com" 
  spec.homepage = "http://www.github.com/browsermedia/bcms_decision_tree"
  spec.files += Dir["app/**/*"]
  spec.files -= Dir["app/views/layouts/templates/default.html.erb"]
  spec.files += Dir["db/migrate/*.rb"]
  spec.files -= Dir["db/migrate/*_browsercms_*.rb"]
  spec.files += Dir["lib/**/*"]
  spec.files -= Dir["lib/tasks/build_gem.rake"]
  spec.files += Dir["public/bcms/decision_tree/**/*"]
  spec.files += Dir["LICENSE.txt"]
  spec.files += Dir["GPL.txt"]
  spec.files += Dir["Gemfile"]
  spec.files += Dir["Copyright.txt"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]

  spec.add_dependency('browsercms', "3.3.2")

end