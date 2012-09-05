class AddScheduledToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :scheduled, :boolean
  end
end
