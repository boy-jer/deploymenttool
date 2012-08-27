require 'spec_helper'

describe Version do

  it "has a valid factory" do
    FactoryGirl.build(:version).should be_valid
  end

  context "attribute is missing" do
  
    required_attributes = [:creative, :audience_id, :campaign_id]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:version, attribute => '').should_not be_valid
      end
    end
    
  end

end
