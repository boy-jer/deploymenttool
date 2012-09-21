class AddSendListIdAndContactIdToSendListContacts < ActiveRecord::Migration
  def change
    add_column :send_lists_contacts, :contact_id, :integer
    add_column :send_lists_contacts, :send_list_id, :integer
  end
end
