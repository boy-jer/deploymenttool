class Demographic < ActiveRecord::Base
  attr_accessible :audience_id, :count, :segment_id
  
  validates :audience_id, :segment_id, :presence => true
  
  belongs_to :segment
  belongs_to :audience
end
