class AddSegmentationToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :segmentation, :text
  end
end
