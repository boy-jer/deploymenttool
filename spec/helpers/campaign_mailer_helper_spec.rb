require 'spec_helper'

describe CampaignMailerHelper do
  
  before :each do 
    include CampaignMailerHelper
  end
  
  it '' do
  end
  
  describe '#message' do
    it 'should return the path to a partial found in the messages folder' do
      partial_path = message 'test'
      partial_path.should == 'campaign_mailer/messages/test_message'
    end
  end

  describe '#table' do
    it 'should return the path to a partial found in the tables folder' do
      partial_path = table 'test'
      partial_path.should == 'campaign_mailer/tables/test_table'
    end
  end

  describe '#footer' do
    it 'should return the path to a partial found in the footers folder' do
      partial_path = footer 'test'
      partial_path.should == 'campaign_mailer/footers/test_footer'
    end
  end
  
end