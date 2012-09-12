require 'spec_helper'

describe Version do

  it "has a valid factory" do
    FactoryGirl.build(:version).should be_valid
  end
  
  before :each do
    @version = FactoryGirl.build(:version)
  end
  
  it { should belong_to(:campaign) }
  it { should have_many(:demographics) }
  it { should have_many(:audiences).through(:demographics) }
  
  subject { @version }
  
  it { should respond_to :counts_subtotal }
  it { should respond_to :audience_list }

  context "attribute is missing" do
    required_attributes = [:creative, :campaign_id, :creative_approval]
    
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
    
      @version.demographics << d1 << d2
    
      @version.counts_subtotal.should == 25
    end
  end

  # clean this up
  describe '#audience_list' do
    it 'should generate a comma seperated list of all of the audiences' do    
      d1 = FactoryGirl.build(:demographic)
      d2 = FactoryGirl.build(:demographic)
      
      d1.audience = FactoryGirl.build(:audience, :code => 'ONE')
      d2.audience = FactoryGirl.build(:audience, :code => 'TWO')
    
      @version.demographics << d1 << d2
    
      @version.audience_list.should == 'ONE, TWO'
    end
  end

end
