class Contact < ActiveRecord::Base
  attr_accessible :email, :name
  
  validates :email, :presence => true

  has_many :subscriptions
  has_many :send_lists, :through => :subscriptions  
  
  def send_format
    '<' + name + '>' + email
  end
end
