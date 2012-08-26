class CreateSendLists < ActiveRecord::Migration
  def change
    create_table :send_lists do |t|
      t.integer, :brand_id
      t.integer :list_type

      t.timestamps
    end
  end
end
