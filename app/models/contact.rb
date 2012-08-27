class Contact < ActiveRecord::Base
  attr_accessible :email, :name
  
  validates :email, :presence => true
  
  def send_format
    '<' + name + '>' + email
  end
end
