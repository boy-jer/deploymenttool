require 'spec_helper'

describe Demographic do

  it "has a valid factory" do
    FactoryGirl.build(:demographic).should be_valid
  end
  
  before :each do
    @demographic =  FactoryGirl.build(:demographic)
  end

  it { should belong_to(:segment) }
  it { should belong_to(:audience) }

end
