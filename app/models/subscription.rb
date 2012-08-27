class Subscription < ActiveRecord::Base
  attr_accessible :send_list_id, :contact_id
  
  belongs_to :send_list
  belongs_to :contact
end