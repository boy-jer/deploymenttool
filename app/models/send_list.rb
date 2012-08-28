class SendList < ActiveRecord::Base
  attr_accessible :brand_id, :list_type
  
  validates :brand_id, :list_type, :presence => true
  
  has_many :subscriptions
  has_many :contacts, :through => :subscriptions
  
  def addresses
  
  end
end
