require 'spec_helper'

describe Contact do

  it "has a valid factory" do
    FactoryGirl.build(:contact).should be_valid
  end
  
  before :each do
    @contact =  FactoryGirl.build(:contact)
  end

  it { should have_many(:subscriptions) }
  it { should have_many(:send_lists).through(:subscriptions) }
  
  subject { @contact }
  
  it { should respond_to :send_format }
  
  context "attribute is missing" do
  
    required_attributes = [:email]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:contact, attribute => '').should_not be_valid
      end
    end
    
  end
  
  describe "#send_format" do
    before :each do
      @send_format = @contact.send_format
    end
    
    it { @send_format.should == '<' + @contact.name + '>' + @contact.email }
  end

end
