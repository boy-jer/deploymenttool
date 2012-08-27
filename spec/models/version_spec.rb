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

  context "attribute is missing" do
  
    required_attributes = [:creative, :audience_id, :campaign_id, :creative_approval]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:version, attribute => '').should_not be_valid
      end
    end
    
  end

end
