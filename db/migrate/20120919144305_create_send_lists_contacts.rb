class CreateSendListsContacts < ActiveRecord::Migration
  def change
    create_table :send_lists_contacts do |t|

      t.timestamps
    end
  end
end
