require 'spec_helper'

describe Segment do

  it "has a valid factory" do
    FactoryGirl.build(:segment).should be_valid
  end
  
  before :each do 
    @segment = FactoryGirl.build(:segment)
  end

  it { should belong_to(:campaign) }

end
