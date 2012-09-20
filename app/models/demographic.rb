class Demographic < ActiveRecord::Base
  attr_accessible :audience_id, :count, :segment_id
  
  validates :audience_id, :version_id, :presence => true
  
  belongs_to :version
  belongs_to :audience

  after_initialize :init

  amoeba do
    enable
    nullify :count
  end

#test the init
private

  def init
    self.count ||= 0
  end

end
