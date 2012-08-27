class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.integer :version_id

      t.timestamps
    end
  end
end
