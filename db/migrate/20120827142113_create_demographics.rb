class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.integer :version_id
      t.integer :audience_id
      t.integer :count

      t.timestamps
    end

    add_index :demographics, [:version_id, :audience_id]
  end
end
