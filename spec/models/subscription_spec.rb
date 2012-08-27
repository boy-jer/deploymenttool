require 'spec_helper'

describe Subscription do

  it "has a valid factory" do
    FactoryGirl.build(:subscription).should be_valid
  end

  it { should belong_to(:send_list) }
  it { should belong_to(:contact) }

end
