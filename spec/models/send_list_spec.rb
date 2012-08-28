require 'spec_helper'

describe SendList do

  it "has a valid factory" do
    FactoryGirl.build(:send_list).should be_valid
  end
  
  before :each do
    @send_list = FactoryGirl.build(:send_list)
  end
  
  subject { @send_list }
  
  it { should respond_to :addresses }

  it { should have_many(:subscriptions) }
  it { should have_many(:contacts).through(:subscriptions) }
  
  context "attribute is missing" do
  
    required_attributes = [:brand_id, :list_type]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:send_list, attribute => '').should_not be_valid
      end
    end
    
  end

end
