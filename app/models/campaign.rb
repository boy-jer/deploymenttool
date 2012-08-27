class Campaign < ActiveRecord::Base
  attr_accessible :data_file, :drop_date, :name, :round, :brand_id, :counts_approval, :suppressions

  validates :name, :drop_date, :brand_id, :round, :presence => true
  
  has_many :versions
  
  def proof_round
    'R' + round.to_s
  end
  
  def date_code
    drop_date.strftime('%Y%m%d')
  end
  
  def month_day_date
    drop_date.strftime('%-m/%d')
  end
end
