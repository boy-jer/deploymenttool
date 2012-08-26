class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string, :creative
      t.integer, :audience_id
      t.string, :subject_line
      t.string, :from
      t.boolean, :creative_approval
      t.integer :campaign_id

      t.timestamps
    end
  end
end
