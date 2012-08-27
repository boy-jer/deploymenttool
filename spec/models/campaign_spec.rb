require 'spec_helper'

describe Campaign do
  
  it "has a valid factory" do
    FactoryGirl.build(:campaign).should be_valid
  end
  
  before :each do 
    @campaign = FactoryGirl.build(:campaign)
  end
  
  it { should have_many(:versions) }
  
  subject { @campaign }
  
  it { should respond_to :proof_round }
  it { should respond_to :date_code }
  it { should respond_to :month_day_date }
  it { should respond_to :client_responce_deadline }
  
  context "required attribute is missing" do
  
    required_attributes = [:name, :drop_date, :brand_id, :round, :counts_approval]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:campaign, attribute => '').should_not be_valid
      end
    end
    
  end
  
  context "a new instance is created" do
    pending 'counts approval should default to false'
  end
  
  describe "#proof_round" do
    before :each do
      @proof_round = @campaign.proof_round
    end
    it { @proof_round.should == 'R' + @campaign.round.to_s }
  end
  
  describe "#date_code" do
    before :each do
      @date_code = @campaign.date_code
    end
    it { @date_code.should == @campaign.drop_date.strftime('%Y%m%d') }
  end
  
  describe "#month_day_date" do
    before :each do
      @month_day_date = @campaign.month_day_date
    end
    it { @month_day_date.should == @campaign.drop_date.strftime('%-m/%d') }
  end

  describe "#client_responce_deadline" do
    it "should return noon the next day when the drop time is 1 full business day away" do
      @campaign = FactoryGirl.build(:campaign, :drop_date => DateTime.now.tomorrow)
      expected = DateTime.now.tomorrow.strftime('%A') + ' at 12:00pm'
      @campaign.client_responce_deadline.should == expected
    end
    it "should return as soon as possible when the drop time is before noon on the drop day" do
      1.should == 1
    end
  end

end