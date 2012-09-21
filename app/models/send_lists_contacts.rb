class SendListsContacts < ActiveRecord::Base
  
  belongs_to :send_list
  belongs_to :contact
  
end
