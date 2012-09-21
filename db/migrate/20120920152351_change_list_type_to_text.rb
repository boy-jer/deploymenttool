class ChangeListTypeToText < ActiveRecord::Migration
  def up
    change_column :send_lists, :list_type, :text
  end

  def down
    change_column :send_lists, :list_type, :integer
  end
end
