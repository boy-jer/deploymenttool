require 'spec_helper'

describe Contact do

  it "has a valid factory" do
    FactoryGirl.build(:contact).should be_valid
  end
  
  context "attribute is missing" do
  
    required_attributes = [:email]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:contact, attribute => '').should_not be_valid
      end
    end
    
  end

end
