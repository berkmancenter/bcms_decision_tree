class Node < ActiveRecord::Base
  acts_as_content_block
  has_and_belongs_to_many :choices, :class_name => 'Node', :foreign_key => 'choice_id', :join_table => 'choices_nodes'
  validates_uniqueness_of :name
  
  def is_question?
    self.choices.length > 1
  end  
  
  def is_choice?
    self.choices.length == 1
  end
  
  def is_answer?
    self.choices.length <= 0
  end

end
