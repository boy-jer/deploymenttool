class RemoveColumnSuppressionAndDataFileFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :data_file, :string
    remove_column :campaigns, :suppressions, :string
  end
end
