class Campaign < ActiveRecord::Base
  attr_accessible :data_file, :drop_date, :name, :round, :brand_id, :counts_approval, :suppressions

  validates :name, :drop_date, :brand_id, :presence => true
end
