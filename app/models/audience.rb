class Audience < ActiveRecord::Base
  attr_accessible :code
  
  validates :code, :presence => true
end