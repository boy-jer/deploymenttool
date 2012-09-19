class Audience < ActiveRecord::Base

  attr_accessible :code, :brand_id
  
  validates :code, :brand_id, :presence => true
  
  belongs_to :brand
  has_many :demographics
  has_many :versions, :through => :demographics

end
