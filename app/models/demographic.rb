class Demographic < ActiveRecord::Base
  attr_accessible :audience_id, :count, :version_id
  
  belongs_to :version
  belongs_to :audience
end
