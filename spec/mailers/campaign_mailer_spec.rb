require "spec_helper"

describe CampaignMailer do
  
  before :each do
    @campaign_mailer = CampaignMailer
  end
  
  subject { @campaign_mailer }
  
  it { should respond_to :proof_email }
  it { should respond_to :counts_email }
  it { should respond_to :final_approval_email }
  it { should respond_to :scheduled_email }
  it { should respond_to :send_detials_email }
  
end
