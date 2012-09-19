class Brand < ActiveRecord::Base
  attr_accessible :code, :color, :mid, :name

  validates :code, :name, :color, :mid, :presence => true
  validates :color, :format => { :with => /^([a-zA-Z0-9]{6})+$/ }
  validates :mid, :format => { :with => /^([0-9]{7})+$/ }
  validates :code, :format => { :with => /^[a-zA-Z]+$/ }

  has_many :send_lists
  has_many :campaigns
  has_many :audiences

  def darken_color(hex_color, amount=0.7)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = (rgb[0].to_i * amount).round
    rgb[1] = (rgb[1].to_i * amount).round
    rgb[2] = (rgb[2].to_i * amount).round
    "#%02x%02x%02x" % rgb
  end  

end