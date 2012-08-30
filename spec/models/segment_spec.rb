require 'spec_helper'

describe Segment do

  it "has a valid factory" do
    FactoryGirl.build(:segment).should be_valid
  end
  
  before :each do 
    @segment = FactoryGirl.build(:segment)
  end

  it { should have_many(:demographics) }
  it { should have_many(:audiences).through(:demographics) }
  
  it { should respond_to :counts_subtotal }
  
  # clean this up
  describe '#counts_subtotal' do
    it 'should generate a subtotal of its constituent demographics' do    
      d1 = FactoryGirl.build(:demographic, :count => 10)
      d2 = FactoryGirl.build(:demographic, :count => 15)
    
      @segment.demographics << d1 << d2
    
      @segment.counts_subtotal.should == 25
    end
  end

end
