class Brand < ActiveRecord::Base
  attr_accessible :code, :color, :mid, :name
  
  validates :code, :name, :color, :mid, :presence => true
  validates :color, :format => { :with => /^([a-zA-Z0-9]{6})+$/ }
  validates :mid, :format => { :with => /^([0-9]{7})+$/ }
  validates :code, :format => { :with => /^[a-zA-Z]+$/ }
end