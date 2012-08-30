class SendList < ActiveRecord::Base
  attr_accessible :brand_id, :list_type

  validates :brand_id, :list_type, :presence => true

  belongs_to :brand
  has_many :subscriptions
  has_many :contacts, :through => :subscriptions

  def addresses
    (contacts.collect! { |c| c.send_format }).join('; ')
  end
end