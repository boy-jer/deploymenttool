class Version < ActiveRecord::Base
  attr_accessible :audience_id, :campaign_id, :creative, :creative_approval, :from, :subject_line
  
  validates :audience_id, :creative, :creative_approval, :campaign_id, :presence => true
  
  belongs_to :campaign
  has_one :segment
  
  def counts_subtotal
    subtotal = 0
    segment.demographics.each { |demographic| subtotal += demographic.count }
    subtotal
  end
end
