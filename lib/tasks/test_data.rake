namespace :decision_tree do
  desc "Create test data"
  task :test_data => :environment do
    Node.create!(:name => "PD", :text => "Public Domain", :publish_on_save => "true")
    Node.create!(:name => "C", :text => "Copyright", :publish_on_save => "true")
    
    Node.create!(:name => "q10a", :text => "Yes, the work was published between 1923 and 1963", :choice_ids => [Node.find(:first, :conditions => {:name => "PD"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q10b", :text => "No, the work was published during or after 1964", :choice_ids => [Node.find(:first, :conditions => {:name => "C"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q10", :text => "Was the work published in the U.S. between 1923 and 1963?", :choice_ids => [Node.find(:first, :conditions => {:name => "q10a"}).id.to_s, Node.find(:first, :conditions => {:name => "q10b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q9a", :text => "Yes, the work was published prior to 1923", :choice_ids => [Node.find(:first, :conditions => {:name => "PD"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q9b", :text => "No, the work was published during or after 1923", :choice_ids => [Node.find(:first, :conditions => {:name => "q10"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q9", :text => "Was the work published in the U.S. prior to 1923?", :choice_ids => [Node.find(:first, :conditions => {:name => "q9a"}).id.to_s, Node.find(:first, :conditions => {:name => "q9b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q8a", :text => "The work was first published outside of the U.S. and was not registered in 
    the U.S.", :choice_ids => [Node.find(:first, :conditions => {:name => "q10"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q8b", :text => "The work was either registered in the U.S., first published in the U.S., or 
    both", :choice_ids => [Node.find(:first, :conditions => {:name => "q9"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q8", :text => "Was the work first published outside of the U.S., or was it either registered with 
    the copyright office in the U.S. or first published in the U.S.?", :choice_ids => [Node.find(:first, :conditions => {:name => "q8a"}).id.to_s, Node.find(:first, :conditions => {:name => "q8b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q7a", :text => "Yes, the work was created before 1890", :choice_ids => [Node.find(:first, :conditions => {:name => "PD"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q7b", :text => "No, the work was created during or after 1890", :choice_ids => [Node.find(:first, :conditions => {:name => "C"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q7", :text => "Was the work created before 1890?", :choice_ids => [Node.find(:first, :conditions => {:name => "q7a"}).id.to_s, Node.find(:first, :conditions => {:name => "q7b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q6a", :text => "Yes, the author died before 1940", :choice_ids => [Node.find(:first, :conditions => {:name => "PD"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q6b", :text => "No, the author died during or after 1940, or is still alive", :choice_ids => [Node.find(:first, :conditions => {:name => "C"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q6c", :text => "The date of death of the author is unknown by the Copyright Office", :choice_ids => [Node.find(:first, :conditions => {:name => "q7"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q6", :text => "Did the author die before 1940?", :choice_ids => [Node.find(:first, :conditions => {:name => "q6a"}).id.to_s, Node.find(:first, :conditions => {:name => "q6b"}).id.to_s, Node.find(:first, :conditions => {:name => "q6c"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q5a", :text => "Yes, the author of the work is known", :choice_ids => [Node.find(:first, :conditions => {:name => "q6"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q5b", :text => "No, the author of the work is anonymous or pseudonymous", :choice_ids => [Node.find(:first, :conditions => {:name => "q7"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q5", :text => "Is the author of the work known?", :choice_ids => [Node.find(:first, :conditions => {:name => "q5a"}).id.to_s, Node.find(:first, :conditions => {:name => "q5b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q4a", :text => "Yes, the work was made for hire", :choice_ids => [Node.find(:first, :conditions => {:name => "q8"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q4b", :text => "No, the work was not made for hire", :choice_ids => [Node.find(:first, :conditions => {:name => "q5"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q4", :text => "Was the work made for hire?", :choice_ids => [Node.find(:first, :conditions => {:name => "q4a"}).id.to_s, Node.find(:first, :conditions => {:name => "q4b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q3a", :text => "Yes, the work was either published or registered", :choice_ids => [Node.find(:first, :conditions => {:name => "q8"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q3b", :text => "No, the work was neither published nor registered", :choice_ids => [Node.find(:first, :conditions => {:name => "q4"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q3", :text => "Was the work ever published or registered with the U.S. Copyright Office?", :choice_ids => [Node.find(:first, :conditions => {:name => "q3a"}).id.to_s, Node.find(:first, :conditions => {:name => "q3b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q2a", :text => "Yes, the work was prepared by an officer or employee of the U.S. 
    government as part of that person's official duties", :choice_ids => [Node.find(:first, :conditions => {:name => "PD"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q2b", :text => "No, the work was prepared by an officer or employee of the U.S. 
    government outside of that person's official duties", :choice_ids => [Node.find(:first, :conditions => {:name => "q3"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q2c", :text => "No, the work was not prepared by an officer or employee of the U.S. 
    government", :choice_ids => [""], :publish_on_save => "true")
    Node.create!(:name => "q2", :text => "Was the work prepared by an officer or employee of the U.S. government (not a 
    contractor or grantee of the U.S. government) as part of that person's official 
    duties?", :choice_ids => [Node.find(:first, :conditions => {:name => "q2a"}).id.to_s, Node.find(:first, :conditions => {:name => "q2b"}).id.to_s], :publish_on_save => "true")
    
    Node.create!(:name => "q1a", :text => "Yes, the work is a sound recording", :choice_ids => [Node.find(:first, :conditions => {:name => "q7"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q1b", :text => "No, the work is not a sound recording", :choice_ids => [Node.find(:first, :conditions => {:name => "q8"}).id.to_s], :publish_on_save => "true")
    Node.create!(:name => "q1", :text => "Is the work a sound recording?", :choice_ids => [Node.find(:first, :conditions => {:name => "q1a"}).id.to_s, Node.find(:first, :conditions => {:name => "q1b"}).id.to_s], :publish_on_save => "true", :first => "true")
    
    puts "Done!"
  end 
end