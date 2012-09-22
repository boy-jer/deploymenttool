class SendList < ActiveRecord::Base
  attr_accessible :brand_id, :list_name

  validates :brand_id, :list_name, :presence => true

  belongs_to :brand
  has_many :send_lists_contacts
  has_many :contacts, :through => :send_lists_contacts

  TYPES = [:proof, :count, :final_approval, :scheduled, :send_detials]

  def addresses
    (contacts.collect! { |c| c.send_format }).join('; ')
  end
end