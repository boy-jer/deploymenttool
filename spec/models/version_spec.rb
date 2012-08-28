require 'spec_helper'

describe Version do

  it "has a valid factory" do
    FactoryGirl.build(:version).should be_valid
  end
  
  before :each do
    @version = FactoryGirl.build(:version)
  end
  
  it { should belong_to(:campaign) }
  it { should have_one(:segment) }
  
  subject { @version }
  
  it { should respond_to :counts_subtotal }

  context "attribute is missing" do
    required_attributes = [:creative, :audience_id, :campaign_id, :creative_approval]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:version, attribute => '').should_not be_valid
      end
    end
  end
  
  # clean this up
  describe '#counts_subtotal' do
    it 'should generate a subtotal of its constituent demographics' do    
      d1 = FactoryGirl.build(:demographic, :count => 10)
      d2 = FactoryGirl.build(:demographic, :count => 15)
    
      @version.segment.demographics << d1 << d2
    
      @version.counts_subtotal.should == 25
    end
  end

end
