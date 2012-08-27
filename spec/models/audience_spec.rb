require 'spec_helper'

describe Audience do

  it "has a valid factory" do
    FactoryGirl.build(:audience).should be_valid
  end
  
  context "attribute is missing" do
  
    required_attributes = [:code]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:audience, attribute => '').should_not be_valid
      end
    end
    
  end

end
