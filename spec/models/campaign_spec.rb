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
  
  context "attribute is missing" do
  
    required_attributes = [:name, :drop_date, :brand_id, :round]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:campaign, attribute => '').should_not be_valid
      end
    end
    
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

end
