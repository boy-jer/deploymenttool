require 'spec_helper'

describe Campaign do
  
  # Boolean approval checks
  # Order of models, :order => name
  
  it "has a valid factory" do
    FactoryGirl.build(:campaign).should be_valid
  end
  
  before :each do 
    @campaign = FactoryGirl.build(:campaign)
  end
  
  it { should have_many(:versions) }
  it { should belong_to(:brand) }
  it { should have_many(:segments) }
  
  subject { @campaign }
  
  it { should respond_to :proof_round }
  it { should respond_to :get_drop_date_as }
  it { should respond_to :client_responce_deadline }
  it { should respond_to :counts_total }
  it { should respond_to :treatment_name }
  it { should respond_to :live_segmentations }

  it { should respond_to :is_approved? }
  it { should respond_to :counts_provided? }

  it 'requires a brand be present' do
    @campaign.brand.class == 'Brand' 
  end

  context "required attribute is missing" do
    required_attributes = [:name, :drop_date, :brand_id, :round, :counts_approval, :scheduled]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:campaign, attribute => '').should_not be_valid
      end
    end
  end
  
  context 'a campaign is deleted' do
    it 'should destory all of its versions' do
      pending 'need to write spec'
    end
  end
  
  context "a new instance is created" do
    pending 'counts approval should default to false'
  end
  
  describe "#live_segmentations" do
    pending 'tests'
  end
  
  describe "#proof_round" do
    before :each do
      @proof_round = @campaign.proof_round
    end
    it { @proof_round.should == 'R' + @campaign.round.to_s }
  end

  it 'should format dates'  do
    pending 'date_format method'
  end

  # Note that the TimeZone is hard coded at the moment. This should be dynamic at some point.  
  describe "#get_drop_date_as" do
    before :each do
      @campaign = FactoryGirl.build(:campaign, :drop_date => "2012-08-29 02:30:00")
    end
    subject { @campaign }
    
    context ':date_code is passed the argument' do
      it { (@campaign.get_drop_date_as :date_code).should == '20120829' }
    end
    context ':month_and_day is passed the argument' do
      it { (@campaign.get_drop_date_as :month_and_day).should == '8/29' }
    end
    context ':time is passed the argument' do
      it { (@campaign.get_drop_date_as :time).should == '2:30am PST' }
    end
    context ':full_drop_date' do
      it { (@campaign.get_drop_date_as :full_drop_date).should == '8/29/2012 2:30am PST' }
    end
  end
  
  describe '#is_approved?' do
    context 'all creatives and counts approvals are set to true' do
      it 'should return true' do
        campaign = FactoryGirl.build(:campaign, :counts_approval => TRUE)
        v1 = FactoryGirl.build(:version, :creative_approval => TRUE)
        v2 = FactoryGirl.build(:version, :creative_approval => TRUE)
        campaign.versions << v1 << v2
        
        campaign.is_approved?.should be_true
      end
    end
    context 'creative or counts approvals are not set to true' do
      it 'should return false' do
        campaign = FactoryGirl.build(:campaign, :counts_approval => FALSE)
        v1 = FactoryGirl.build(:version, :creative_approval => TRUE)
        v2 = FactoryGirl.build(:version, :creative_approval => FALSE)
        campaign.versions << v1 << v2
        
        campaign.is_approved?.should be_false
      end
    end
  end

  describe '#client_responce_deadline' do
    it 'returns noon the next day when the drop time is 1 full business day away' do
      @campaign = FactoryGirl.build(:campaign, :drop_date => DateTime.now.tomorrow)
      expected = DateTime.now.tomorrow.strftime('%A') + ' at 12:00pm'
      @campaign.client_responce_deadline.should == expected
    end
    it 'returns "as soon as possible." when the drop time is before noon on the drop day' do
      pending 'Undefined spec method.'
    end
    it 'when campaign is due after Monday and its currently Friday' do
    
    end
    it 'when campaign is due on a Monday and it is currently Friday' do 
      pending 'Undefined spec method'
    end
    it 'when campaign is full day away and the drop day is not Friday, Saturday or Sunday' do 
      pending 'Undefined spec method.'
    end
  end
  
  describe "#counts_total" do
    it 'should generate a total of all its constituent versions' do
      v1 = FactoryGirl.build(:version)
      v2 = FactoryGirl.build(:version)
      
      d1 = FactoryGirl.build(:demographic, :count => 10)
      d2 = FactoryGirl.build(:demographic, :count => 13)
      
      v1.demographics << d1
      v2.demographics << d2
    
      @campaign.versions << v1 << v2
    
      @campaign.counts_total.should == 23
    end
  end

  describe "#treatment_name" do
    it "returns corretly formated treatment name" do
      brand = FactoryGirl.build(:brand, :code => 'FOOB')

      @campaign = FactoryGirl.build(:campaign, :name => 'Foo Bar', :brand => brand, :drop_date => "2012-08-29")
      
      @campaign.treatment_name.should == '20120829_FOOB_FooBar'
    end
  end

end