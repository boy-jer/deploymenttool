require 'spec_helper'

describe SendListsContact do

  it "has a valid factory" do
    FactoryGirl.build(:send_lists_contact).should be_valid
  end
  
  before :each do 
    @send_list = FactoryGirl.build(:send_lists_contact)
  end
  
  it { should belong_to(:send_list) }
  it { should belong_to(:contact) }
  
  subject { @send_list }

end
