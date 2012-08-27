class SendList < ActiveRecord::Base
  attr_accessible :brand_id, :list_type
  
  validates :brand_id, :list_type, :presence => true
end
