class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :send_list_id
      t.integer :contact_id

      t.timestamps
    end
    
    add_index :subscriptions, [:send_list_id, :contact_id]
  end
end
