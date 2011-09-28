class CreateNodes < ActiveRecord::Migration
  def self.up
    create_content_table :nodes do |t|
      t.text :text
      t.boolean :first, :default => false
    end
    
    create_table(:choices_nodes, :id => false) do |t|
      t.references :choice
      t.references :node
    end
    
    ContentType.create!(:name => "Node", :group_name => "Node")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'Node'])
    CategoryType.all(:conditions => ['name = ?', 'Node']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :node_versions
    drop_table :nodes
    drop_table :choices_nodes
  end
end
