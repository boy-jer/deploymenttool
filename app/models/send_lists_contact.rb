class SendListsContact < ActiveRecord::Base
  
  attr_accessible :contact_id, :send_list_id

  validates_uniqueness_of :contact_id, :scope => :send_list_id
  
  belongs_to :send_list
  belongs_to :contact
  
end
