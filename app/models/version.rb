class Version < ActiveRecord::Base
  attr_accessible :audience_id, :campaign_id, :creative, :creative_approval, :from, :subject_line
  
  validates :audience_id, :creative, :creative_approval, :campaign_id, :presence => true
end
