class AddCampaignIdToSegmentAndRemoveVersionId < ActiveRecord::Migration
  def change
    add_column :segments, :campaign_id, :integer
    remove_column :segments, :version_id, :integer
  end
end
