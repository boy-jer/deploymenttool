class RenameListTypeToListName < ActiveRecord::Migration
  def up
    rename_column :send_lists, :list_type, :list_name
  end

  def down
    rename_column :send_lists, :list_name, :list_type
  end
end
