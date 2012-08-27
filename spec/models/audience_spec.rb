require 'spec_helper'

describe Audience do

  it "has a valid factory" do
    FactoryGirl.build(:audience).should be_valid
  end
  
  it { should belong_to(:brand) }
  it { should have_many(:demographics) }
  it { should have_many(:versions).through(:demographics) }

  context "attribute is missing" do
  
    required_attributes = [:code, :brand_id]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:audience, attribute => '').should_not be_valid
      end
    end
    
  end

end
