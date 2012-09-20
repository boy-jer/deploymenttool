class CampaignMailer < ActionMailer::Base
  default from: "nicolas@exacttarget.com"

  VALID_TYPES = %q!:proof :counts :approval :scheduled :send_detials!

  # Really need to learn to throw exceptions.
  def method_missing(method_name, *arguments)
    return unless is_valid_method? method_name && arguments[0].class == 'Campaign'

    @campaign = arguments[0]
    mail_type = get_mail_type method_name

    to = (@campaign.send_lists.find_by_list_type mail_type).addresses
    subject_line = get_subject_line mail_type campaign # Is there some sort of yield that could be done?

    mail( :to => to, :subject => subject )    
  end

  # REMOVE THIS KEEP IT IN THE HELPER
  def get_subject_line(mail_type, campaign)
    return "#{campaign.proof_round} PROOFS FROM ET:" if mail_type == :proof
    return "COUNTS FOR APPROVAL: #{campaign.treatment_name}" if mail_type == :counts
    return "REQUESTING FINAL APPROVAL: #{campaign.treatment_name}" if mail_type == :approval
    return "SCHEDULED BY ET: #{campaign.treatment_name}" if mail_type == :scheduled
    return "SEND DETIALS: #{campaign.treatment_name}" if mail_type == :send_detials
  end

private

  # Returns true if the method called is a valid format for the CampaignMailer to work with.
  def is_valid_method?(method_name)
    TRUE if method_name.split('_').last == 'email' && (VALID_TYPES.include? get_mail_type method_name)
  end

  # Returns everything before the last underscore as a symbol. I laughed when I wrote this bad boy....
  def get_mail_type(method_name)
     method_name.reverse.split('_', 2).last.reverse.to_sym
  end

end