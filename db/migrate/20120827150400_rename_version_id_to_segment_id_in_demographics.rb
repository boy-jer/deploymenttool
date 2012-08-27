class RenameVersionIdToSegmentIdInDemographics < ActiveRecord::Migration
  def up
    rename_column :demographics, :version_id, :segment_id
  end

  def down
    rename_column :demographics, :segment_id, :version_id
  end
end
