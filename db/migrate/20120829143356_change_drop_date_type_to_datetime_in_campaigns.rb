class ChangeDropDateTypeToDatetimeInCampaigns < ActiveRecord::Migration
  def up
    change_column :campaigns, :drop_date, :datetime
  end

  def down
    change_column :campaigns, :drop_date, :date
  end
end
