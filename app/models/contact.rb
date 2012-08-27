class Contact < ActiveRecord::Base
  attr_accessible :email, :name
  
  validates :email, :presence => true
end
