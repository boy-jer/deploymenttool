class Campaign < ActiveRecord::Base

  attr_accessible :data_file, :drop_date, :name, :round, :brand_id, :counts_approval, :suppressions, 
  :scheduled, :alt_id

  validates :name, :drop_date, :brand_id, :round, :presence => true
  validates :counts_approval, :scheduled, :inclusion => {:in => [true, false]}

  has_many :versions, :dependent => :destroy
  belongs_to :brand
  has_many :segments
  
  amoeba do
    enable
    clone [:versions]
    set :counts_approval => 0
    set :scheduled => 0
    set :round => 0
  end

  after_initialize :init

  def get_drop_date_as(formatting)
    return drop_date.strftime('%Y%m%d') if formatting == :date_code
    return drop_date.strftime('%-m/%-d') if formatting == :month_and_day
    return drop_date.strftime('%-I:%M%P PST') if formatting == :time
    return drop_date.strftime('%-m/%-d/%Y %-I:%M%P PST') if formatting == :full_drop_date
  end
  
  #THIS NEEDS A SPEC OR TEST
  #Consider getting audience list as a simply array that would remove all these issues.
  # Rewrite the spec that way.
  # Also think about simply adding these segments into the campaigns segments list.
  # They are segments, just generated on the FLY.
  def live_segmentations
    segmentations = Array.new
    
    
    segment = self.segments.new
    
    segmentations << segment.script("SELECT * FROM [$$brand_code$$_WeeklyCampaign] WHERE campaign_id = $$campaign_id$$")
    segmentations << segment.script("SELECT * FROM [$$brand_code$$_Whole] Whole WHERE NOT EXISTS ( SELECT * FROM [$$brand_code$$_UNSUBS] Unsubs WHERE Unsubs.email_address = Whole.email_address ) AND NOT EXISTS ( SELECT * FROM ent.[ET_UNSUB] GlobalUnsubs WHERE GlobalUnsubs.email_address = Whole.email_address )")
    
    versions.each do |v|
      list = (v.audience_list.split(',').collect { |a| "'" + a.lstrip + "'" }).join(', ')
      segmentations << segment.script("SELECT * FROM [$$treatment_name$$_WAU] WHERE email_version IN (#{list})")        
    end
    
    segmentations;
  end

  def proof_round
    'R' + round.to_s
  end
  
  def is_approved?
    if counts_approval
      versions.each do |v|
        return FALSE unless v.creative_approval
      end
    else
      return FALSE
    end
    return TRUE
  end
  
  def counts_provided?
    versions.each { |v| return FALSE if !v.all_audiences_have_counts? }
  end

  def treatment_name
    [get_drop_date_as(:date_code), brand.code, camel(name)].join('_')
  end

  def client_responce_deadline
    return DateTime.now.tomorrow.strftime('%A') + ' at 12:00pm' if drop_date.yesterday.past?
    
    'As soon as possible' if 0 == 1
    
    'Immediatly' if 0 == 1
  end

  def counts_total
    total = 0; versions.each {|v| total += v.counts_subtotal}; total
  end

  def date_format(date)
    DateTime.strptime(date, "%m/%d/%Y %I:%M%P")
  end

private

  def init
    self.round ||= 0
    self.counts_approval ||= FALSE #will set the default value only if it's nil
    self.scheduled ||= FALSE
    
    ## Add segments?
    
  end

  def camel(string)
    string.split(' ').join('_').camelize
  end

end