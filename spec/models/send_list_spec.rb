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

  it { should belong_to(:brand) }
  it { should have_many(:send_lists_contacts) }
  it { should have_many(:contacts).through(:send_lists_contacts) }
  
  context "attribute is missing" do
    required_attributes = [:brand_id, :list_name]
    
    required_attributes.each do |attribute|
      it "if #{attribute.to_s} is missing, it should be invalid" do
        campaign = FactoryGirl.build(:send_list, attribute => '').should_not be_valid
      end
    end
  end
  
  describe 'TYPES' do
    it "have a constant named TYPES" do
      pending 'Check for Types'
    end
  end
  
  describe '#addresses' do
    it 'should return a colon seperates list of all contact emails' do
      c1 = FactoryGirl.build(:contact, :name => 'Bar Foo', :email => 'bar@foo.com' )
      c2 = FactoryGirl.build(:contact, :name => 'Foo Bar', :email => 'foo@bar.com' )
      @send_list.contacts << c1 << c2
      
      @send_list.addresses.should == '<Bar Foo>bar@foo.com; <Foo Bar>foo@bar.com'
    end
  end

end
