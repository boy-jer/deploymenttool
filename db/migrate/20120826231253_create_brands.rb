class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :code
      t.string :name
      t.string :color
      t.integer :mid

      t.timestamps
    end
  end
end
