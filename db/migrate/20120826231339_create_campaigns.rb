class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :data_file
      t.date :drop_date

      t.timestamps
    end
  end
end
