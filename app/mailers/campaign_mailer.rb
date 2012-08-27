class CampaignMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def proof_email(campaign)
    @campaign = campaign
    mail( :to => 'nofuim13@gmail.com', :subject => "Test" )
  end
  
  def counts_email
  end
  
  def final_approval_email
  end
  
  def scheduled_email
  end
  
  def send_detials_email
  end
end
