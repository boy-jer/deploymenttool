class Segment < ActiveRecord::Base
  attr_accessible :version_id
  
  has_many :demographics
  has_many :audiences, :through => :demographics
end
