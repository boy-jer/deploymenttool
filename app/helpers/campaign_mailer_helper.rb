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

private

  def view_folder
    'campaign_mailer'
  end

end
