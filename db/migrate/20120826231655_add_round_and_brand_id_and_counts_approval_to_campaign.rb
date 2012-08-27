class AddRoundAndBrandIdAndCountsApprovalToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :round, :integer
    add_column :campaigns, :brand_id, :integer
    add_column :campaigns, :counts_approval, :boolean
  end
end
