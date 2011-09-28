require 'cms/module_installation'

class BcmsDecisionTree::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__

  # Add migrations to be copied, by uncommenting the following file and editing as needed.
  copy_migration_file '20110928165922_create_nodes.rb'

end
