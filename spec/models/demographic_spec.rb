require 'spec_helper'

describe Demographic do

  it "has a valid factory" do
    FactoryGirl.build(:demographic).should be_valid
  end
  
  before :each do
    @demographic =  FactoryGirl.build(:demographic)
  end

  it { should belong_to(:version) }
  it { should belong_to(:audience) }

  context "required attribute is missing" do
    required_attributes = [:version_id, :audience_id]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:demographic, attribute => '').should_not be_valid
      end
    end
  end

end
