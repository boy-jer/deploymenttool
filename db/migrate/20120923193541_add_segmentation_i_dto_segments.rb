class AddSegmentationIDtoSegments < ActiveRecord::Migration
  def change
    add_column :segments, :segmentation_id, :integer
  end
end
