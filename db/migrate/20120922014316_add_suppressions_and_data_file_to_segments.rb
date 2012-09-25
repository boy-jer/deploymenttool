class AddSuppressionsAndDataFileToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :suppressions, :string
    add_column :segments, :data_file, :string
  end
end
