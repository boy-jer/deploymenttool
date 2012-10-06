class AddNameToAudiences < ActiveRecord::Migration
  def change
    add_column :audiences, :name, :string
  end
end
