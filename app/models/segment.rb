class Segment < ActiveRecord::Base
  attr_accessible :version_id
  
  has_many :demographics
  has_many :audiences, :through => :demographics

  def counts_subtotal
    subtotal = 0; demographics.each { |d| subtotal += d.count }; subtotal
  end
end
