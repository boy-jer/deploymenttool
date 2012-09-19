class Contact < ActiveRecord::Base
  attr_accessible :email, :name

  validates :email, :presence => true
  validates :name, :format => { :with => /^[a-zA-z ]*$/} # Alpha, Nil and Spaces

  has_many :subscriptions
  has_many :send_lists, :through => :subscriptions  

  def send_format
    name ?  '<' + name + '>' + email : email
  end
end