class AddBrandIdToAudiences < ActiveRecord::Migration
  def change
    add_column :audiences, :brand_id, :integer
  end
end
