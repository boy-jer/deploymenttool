require 'spec_helper'

describe Brand do

  it "has a valid factory" do
    FactoryGirl.build(:brand).should be_valid
  end
  
  before :each do
    @brand = FactoryGirl.build(:brand)
  end
  
  it { should have_many(:campaigns) }
  
  context "attribute is missing" do
  
    required_attributes = [:code, :name, :color, :mid]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:brand, attribute => '').should_not be_valid
      end
    end
    
  end
  
  context "color" do
  
    it "must only be 6 alphanumeric characters" do
      invalid_inputs = ['6g5rtfs3', '6g5r', 'FFF FF', 'hgtgf$']

      invalid_inputs.each  { |i| FactoryGirl.build(:brand, :color => i).should_not be_valid }
      
      FactoryGirl.build(:brand, :color => 'FFFFFF').should be_valid
    end
  
  end
  
  context "mid" do
  
    it "must be exactly 7 numbers" do
      invalid_inputs = ['444444444', '444', 'gthgfrt', '7632 42']

      invalid_inputs.each  { |i| FactoryGirl.build(:brand, :mid => i).should_not be_valid }

      FactoryGirl.build(:brand, :mid => '1234567').should be_valid
    end
  
  end

  context "code" do
  
    it "must be only alpha characters" do
      invalid_inputs = ['444444', 'DDDD!', 'gth6rt', 'FO B']

      invalid_inputs.each  { |i| FactoryGirl.build(:brand, :code => i).should_not be_valid }

      FactoryGirl.build(:brand, :code => 'FOOB').should be_valid
    end
  
  end

end
