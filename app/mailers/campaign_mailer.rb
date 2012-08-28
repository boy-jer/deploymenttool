class CampaignMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def proof_email(campaign)
    @campaign = campaign
    
    subject_line = "#{@campaign.proof_round} PROOFS FROM ET:"
    
    mail( :to => 'nofuim13@gmail.com', :subject => "Test" )
  end
  
  def counts_email(campaign)
    @campaign = campaign
    
    subject_line = "COUNTS FOR APPROVAL: #{@campaign.treatment_name}"
    
    mail( :to => 'nofuim13@gmail.com', :subject => "Test" )
  end
  
  def final_approval_email(campaign)
    @campaign = campaign
    
    subject_line = "REQUESTING FINAL APPROVAL: #{@campaign.treatment_name}"
    
    mail( :to => 'nofuim13@gmail.com', :subject => "Test" )
  end
  
  def scheduled_email(campaign)
    @campaign = campaign
    
    subject_line = "SCHEDULED BY ET: #{@campaign.treatment_name}"
    
    mail( :to => 'nofuim13@gmail.com', :subject => "Test" )
  end
  
  def send_detials_email(campaign)
    @campaign = campaign
    
    subject_line = "SEND DETIALS: #{@campaign.treatment_name}"
    
    mail( :to => 'nofuim13@gmail.com', :subject => "Test" )
  end
end
