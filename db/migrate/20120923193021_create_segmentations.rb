class CreateSegmentations < ActiveRecord::Migration
  def change
    create_table :segmentations do |t|
      t.integer :campaign_id

      t.timestamps
    end
  end
end
