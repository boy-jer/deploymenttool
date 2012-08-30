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

  describe 'name' do
    context 'has non alpha characters' do
      it 'it has a number' do
        contact = FactoryGirl.build(:contact, :name => 'Foo5')
        contact.should_not be_valid
      end
      it 'it has symbols' do
        contact = FactoryGirl.build(:contact, :name => 'Foo$')
        contact.should_not be_valid
      end
    end
    it 'contains only alpha characters' do
      contact = FactoryGirl.build(:contact, :name => 'Foo')
      contact.should be_valid
    end
  end

  describe "#send_format" do
    it "should correcrtly format its name and email" do
      send_format = FactoryGirl.build(:contact, :name => 'Foo Bar', :email => 'foo@bar.com' ).send_format
      send_format.should == '<Foo Bar>foo@bar.com'
    end
    it "should degrade to just an e-mail when no name is present" do
      send_format = FactoryGirl.build(:contact, :name => NIL, :email => 'foo@bar.com' ).send_format
      send_format.should == 'foo@bar.com'
    end    
  end

end