class Segment < ActiveRecord::Base
  attr_accessible :version_id

  belongs_to :version
end
