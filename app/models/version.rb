class Version < ActiveRecord::Base
  attr_accessible :audience_id, :campaign_id, :creative, :creative_approval, :from, :subject_line

  validates :creative, :campaign_id, :presence => true
  validates :creative_approval, :inclusion => {:in => [true, false]}

  belongs_to :campaign
  has_many :demographics
  has_many :audiences, :through => :demographics


  after_initialize :init
  
  def counts_subtotal
    subtotal = 0; demographics.each { |d| subtotal += d.count }; subtotal
  end
  
  def audience_list
    (demographics.collect { |d| d.audience.code }).join(', ')
  end
  
private

  def init
    self.creative_approval ||= FALSE
  end

end
