class Campaign < ActiveRecord::Base
  attr_accessible :data_file, :drop_date, :name, :round, :brand_id, :counts_approval, :suppressions

  validates :name, :drop_date, :brand_id, :round, :counts_approval, :presence => true
  
  has_many :versions
  belongs_to :brand
  
  after_initialize :init
  
  def proof_round
    'R' + round.to_s
  end
  
  def date_code
    drop_date.strftime('%Y%m%d')
  end
  
  def month_day_date
    drop_date.strftime('%-m/%d')
  end
  
  #needs camelization.
  def treatment_name
    [date_code, brand.code, camel(name)].join('_')
  end
  
  # Logic is a work in progress here.
  def client_responce_deadline
    return DateTime.now.tomorrow.strftime('%A') + ' at 12:00pm' if drop_date.yesterday.past?
    
    'As soon as possible' if 0 == 1
    
    'Immediatly' if 0 == 1
  end

  def counts_total
    total = 0
    versions.each { |version| total += version.counts_subtotal }
    total
  end

private

  def init
    self.counts_approval ||= FALSE #will set the default value only if it's nil
  end
  
  def camel(string)
    string.split(' ').join('_').camelize
  end

end
