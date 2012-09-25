class Segmentation < ActiveRecord::Base
  attr_accessible :campaign_id
  
  has_many :segments
  belongs_to :campaign
  
end
