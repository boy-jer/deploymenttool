module CampaignMailerHelper
  def get(type)
    
  end

  def message(message)
    view_folder + '/messages/' + message + '_message'
  end

  def table(table)
    view_folder + '/tables/' + table + '_table'
  end

  def footer(footer)
    view_folder + '/footers/' + footer + '_footer'
  end

  def get_subject_line(mail_type, campaign)
    return "#{campaign.brand.code} #{campaign.proof_round} Proofs for Approval: #{campaign.treatment_name}" if mail_type == :proof
    return "#{campaign.brand.code} Counts for Approval: #{campaign.treatment_name}" if mail_type == :counts
    return "#{campaign.brand.code} FINAL APPROVAL: #{campaign.treatment_name}" if mail_type == :approval
    return "#{campaign.brand.code} SCHEDULED: #{campaign.treatment_name}" if mail_type == :scheduled
    return "#{campaign.brand.code} Send Details: #{campaign.treatment_name}" if mail_type == :send_detials
  end

private

  def view_folder
    'campaign_mailer'
  end

end
