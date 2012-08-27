class AddSuppressionsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :suppressions, :string
  end
end
