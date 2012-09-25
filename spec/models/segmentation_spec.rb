require 'spec_helper'

describe Segmentation do

  it "has a valid factory" do
    FactoryGirl.build(:segmentation).should be_valid
  end
  
  before :each do 
    @segmentation = FactoryGirl.build(:segmentation)
  end

  it { should belong_to(:campaign) }
  it { should have_many(:segments) }

end
