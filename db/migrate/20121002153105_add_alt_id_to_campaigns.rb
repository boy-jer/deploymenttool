class AddAltIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :alt_id, :integer
  end
end
