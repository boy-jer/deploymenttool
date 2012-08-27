require 'spec_helper'

describe Campaign do
  
  it "has a valid factory" do
    FactoryGirl.build(:campaign).should be_valid
  end
  
  context "attribute is missing" do
  
    required_attributes = [:name, :drop_date, :brand_id]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:campaign, attribute => '').should_not be_valid
      end
    end
    
  end

end
